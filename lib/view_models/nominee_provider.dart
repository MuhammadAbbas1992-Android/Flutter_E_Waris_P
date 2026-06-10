import 'dart:async';

import 'package:flutter/material.dart';

import '../data/models/nominee_model.dart';
import '../data/repositories/nominee_repository.dart';

enum NomineeStatus { initial, loading, loaded, saving, error }

class NomineeProvider extends ChangeNotifier {
  final NomineeRepository _repository;

  NomineeProvider({NomineeRepository? repository})
    : _repository = repository ?? NomineeRepository();

  StreamSubscription<List<NomineeModel>>? _subscription;

  List<NomineeModel> _nominees = [];

  NomineeStatus _status = NomineeStatus.initial;

  String? _errorMessage;

  String? _userId;

  // ----------------------------------------
  // GETTERS
  // ----------------------------------------

  List<NomineeModel> get nominees => _nominees;

  NomineeStatus get status => _status;

  String? get errorMessage => _errorMessage;

  bool get isLoading => _status == NomineeStatus.loading;

  // ----------------------------------------
  // INIT
  // ----------------------------------------

  void init(String userId) {
    if (userId.isEmpty) return;

    if (_userId == userId) return;

    _userId = userId;

    _subscription?.cancel();

    _status = NomineeStatus.loading;

    notifyListeners();

    _subscription = _repository
        .getNominees(userId)
        .listen(
          (data) {
            _nominees = data;
            _status = NomineeStatus.loaded;
            notifyListeners();
          },
          onError: (e) {
            _status = NomineeStatus.error;
            _errorMessage = e.toString();
            notifyListeners();
          },
        );
  }

  // ----------------------------------------
  // SAVE (CREATE + UPDATE)
  // ----------------------------------------

  Future<bool> saveNominee(NomineeModel nominee) async {
    if (_userId == null || _userId!.isEmpty) {
      return false;
    }

    _status = NomineeStatus.saving;

    notifyListeners();

    try {
      if (nominee.id == null || nominee.id!.isEmpty) {
        await _repository.createNominee(nominee, _userId!);
      } else {
        await _repository.updateNominee(nominee, _userId!);
      }

      _status = NomineeStatus.loaded;

      notifyListeners();

      return true;
    } catch (e) {
      _status = NomineeStatus.error;
      _errorMessage = e.toString();

      notifyListeners();

      return false;
    }
  }

  // ----------------------------------------
  // DELETE
  // ----------------------------------------

  Future<bool> deleteNominee(String nomineeId) async {
    if (_userId == null || _userId!.isEmpty) {
      return false;
    }

    try {
      await _repository.deleteNominee(_userId!, nomineeId);

      return true;
    } catch (e) {
      _errorMessage = e.toString();

      notifyListeners();

      return false;
    }
  }

  // ----------------------------------------
  // FIND BY ID
  // ----------------------------------------

  NomineeModel? getNomineeById(String id) {
    try {
      return _nominees.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
