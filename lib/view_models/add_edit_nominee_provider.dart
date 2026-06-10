import 'package:flutter/material.dart';

import '../data/models/nominee_model.dart';
import '../data/repositories/nominee_repository.dart';

class AddEditNomineeProvider extends ChangeNotifier {
  final NomineeRepository _repo;

  AddEditNomineeProvider({NomineeRepository? repo})
      : _repo = repo ?? NomineeRepository();

  // ─────────────────────────────
  // Controllers
  // ─────────────────────────────
  final fullNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  // ─────────────────────────────
  // Relationship Dropdown
  // ─────────────────────────────
  final List<String> relationships = [
    'Spouse',
    'Parent',
    'Child',
    'Sibling',
    'Friend',
    'Business Partner',
    'Other',
  ];

  String? selectedRelationship;

  // ─────────────────────────────
  // Editing Nominee
  // ─────────────────────────────
  NomineeModel? nominee;

  bool isEditMode = false;

  // ─────────────────────────────
  // INIT
  // ─────────────────────────────
  void init(NomineeModel? existing) {
    nominee = existing;

    if (existing != null && existing.id != null) {
      isEditMode = true;

      fullNameCtrl.text = existing.name;
      emailCtrl.text = existing.email;
      phoneCtrl.text = existing.phone;
      selectedRelationship = existing.relationship;

      notifyListeners();
    }
  }

  // ─────────────────────────────
  // CHANGE RELATIONSHIP
  // ─────────────────────────────
  void changeRelationship(String? value) {
    selectedRelationship = value;
    notifyListeners();
  }

  // ─────────────────────────────
  // SAVE NOMINEE
  // ─────────────────────────────
  Future<bool> saveNominee(String userId) async {
    try {
      final nomineeToSave = isEditMode
          ? nominee!.copyWith(
        name: fullNameCtrl.text.trim(),
        email: emailCtrl.text.trim(),
        phone: phoneCtrl.text.trim(),
        relationship: selectedRelationship ?? '',
      )
          : NomineeModel(
        name: fullNameCtrl.text.trim(),
        email: emailCtrl.text.trim(),
        phone: phoneCtrl.text.trim(),
        relationship: selectedRelationship ?? '',
      );

      if (isEditMode) {
        await _repo.updateNominee(nomineeToSave, userId);
      } else {
        await _repo.createNominee(nomineeToSave, userId);
      }

      clearControllers();
      return true;
    } catch (e) {
      debugPrint("Save Nominee Error: $e");
      return false;
    }
  }

  // ─────────────────────────────
  // DELETE NOMINEE
  // ─────────────────────────────
  Future<bool> deleteNominee(String userId) async {
    if (nominee?.id == null) return false;

    try {
      await _repo.deleteNominee(userId, nominee!.id!);

      clearControllers();
      return true;
    } catch (e) {
      debugPrint("Delete Nominee Error: $e");
      return false;
    }
  }

  // ─────────────────────────────
  // VALIDATION
  // ─────────────────────────────
  String? validate() {
    if (fullNameCtrl.text.trim().isEmpty) {
      return "Please enter nominee's full name";
    }

    if (emailCtrl.text.trim().isEmpty) {
      return "Please enter email address";
    }

    if (phoneCtrl.text.trim().isEmpty) {
      return "Please enter phone number";
    }

    if (selectedRelationship == null ||
        selectedRelationship!.trim().isEmpty) {
      return "Please select relationship";
    }

    return null;
  }

  // ─────────────────────────────
  // CLEAR
  // ─────────────────────────────
  void clearControllers() {
    fullNameCtrl.clear();
    emailCtrl.clear();
    phoneCtrl.clear();

    selectedRelationship = null;

    nominee = null;
    isEditMode = false;

    notifyListeners();
  }

  // ─────────────────────────────
  // DISPOSE
  // ─────────────────────────────
  @override
  void dispose() {
    fullNameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    super.dispose();
  }
}