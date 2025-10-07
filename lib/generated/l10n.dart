// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `BHF Player`
  String get app_title {
    return Intl.message('BHF Player', name: 'app_title', desc: '', args: []);
  }

  /// `Import`
  String get import {
    return Intl.message('Import', name: 'import', desc: '', args: []);
  }

  /// `Courses`
  String get courses {
    return Intl.message('Courses', name: 'courses', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Import a File`
  String get import_a_file {
    return Intl.message(
      'Import a File',
      name: 'import_a_file',
      desc: '',
      args: [],
    );
  }

  /// `Choose Encrypted File`
  String get choose_encrypted_file {
    return Intl.message(
      'Choose Encrypted File',
      name: 'choose_encrypted_file',
      desc: '',
      args: [],
    );
  }

  /// `Play Video`
  String get play_video {
    return Intl.message('Play Video', name: 'play_video', desc: '', args: []);
  }

  /// `Add Course`
  String get add_course {
    return Intl.message('Add Course', name: 'add_course', desc: '', args: []);
  }

  /// `Edit Course`
  String get edit_course {
    return Intl.message('Edit Course', name: 'edit_course', desc: '', args: []);
  }

  /// `Delete Course`
  String get delete_course {
    return Intl.message(
      'Delete Course',
      name: 'delete_course',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Add New Course`
  String get add_new_course {
    return Intl.message(
      'Add New Course',
      name: 'add_new_course',
      desc: '',
      args: [],
    );
  }

  /// `Edit Course`
  String get edit_course_title {
    return Intl.message(
      'Edit Course',
      name: 'edit_course_title',
      desc: '',
      args: [],
    );
  }

  /// `Course Name`
  String get course_name {
    return Intl.message('Course Name', name: 'course_name', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter course name here`
  String get enter_course_name {
    return Intl.message(
      'Enter course name here',
      name: 'enter_course_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter password here`
  String get enter_password {
    return Intl.message(
      'Enter password here',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Title is duplicated`
  String get title_duplicated {
    return Intl.message(
      'Title is duplicated',
      name: 'title_duplicated',
      desc: '',
      args: [],
    );
  }

  /// `No courses added yet`
  String get no_courses_added_yet {
    return Intl.message(
      'No courses added yet',
      name: 'no_courses_added_yet',
      desc: '',
      args: [],
    );
  }

  /// `Choose Training Course`
  String get choose_training_course {
    return Intl.message(
      'Choose Training Course',
      name: 'choose_training_course',
      desc: '',
      args: [],
    );
  }

  /// `No videos`
  String get no_videos {
    return Intl.message('No videos', name: 'no_videos', desc: '', args: []);
  }

  /// `Videos`
  String get videos {
    return Intl.message('Videos', name: 'videos', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message('Dark Mode', name: 'dark_mode', desc: '', args: []);
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get about_us {
    return Intl.message('About Us', name: 'about_us', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `العربية`
  String get arabic {
    return Intl.message('العربية', name: 'arabic', desc: '', args: []);
  }

  /// `Save Backup`
  String get save_backup {
    return Intl.message('Save Backup', name: 'save_backup', desc: '', args: []);
  }

  /// `Restore Backup`
  String get restore_backup {
    return Intl.message(
      'Restore Backup',
      name: 'restore_backup',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings_title {
    return Intl.message('Settings', name: 'settings_title', desc: '', args: []);
  }

  /// `File imported successfully`
  String get file_imported_successfully {
    return Intl.message(
      'File imported successfully',
      name: 'file_imported_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Selected:`
  String get selected {
    return Intl.message('Selected:', name: 'selected', desc: '', args: []);
  }

  /// `No file selected yet`
  String get no_file_selected_yet {
    return Intl.message(
      'No file selected yet',
      name: 'no_file_selected_yet',
      desc: '',
      args: [],
    );
  }

  /// `Course added successfully`
  String get course_added_successfully {
    return Intl.message(
      'Course added successfully',
      name: 'course_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Course deleted successfully`
  String get course_deleted_successfully {
    return Intl.message(
      'Course deleted successfully',
      name: 'course_deleted_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Course updated successfully`
  String get course_updated_successfully {
    return Intl.message(
      'Course updated successfully',
      name: 'course_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Delete`
  String get confirm_delete {
    return Intl.message(
      'Confirm Delete',
      name: 'confirm_delete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete course:`
  String get are_you_sure_delete_course {
    return Intl.message(
      'Are you sure you want to delete course:',
      name: 'are_you_sure_delete_course',
      desc: '',
      args: [],
    );
  }

  /// `Cannot undo this action`
  String get cannot_undo_this_action {
    return Intl.message(
      'Cannot undo this action',
      name: 'cannot_undo_this_action',
      desc: '',
      args: [],
    );
  }

  /// `Backup saved successfully`
  String get backup_saved_successfully {
    return Intl.message(
      'Backup saved successfully',
      name: 'backup_saved_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Error occurred while saving data`
  String get error_occurred_while_saving {
    return Intl.message(
      'Error occurred while saving data',
      name: 'error_occurred_while_saving',
      desc: '',
      args: [],
    );
  }

  /// `Data restored successfully`
  String get data_restored_successfully {
    return Intl.message(
      'Data restored successfully',
      name: 'data_restored_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Error occurred while restoring data`
  String get error_occurred_while_restoring {
    return Intl.message(
      'Error occurred while restoring data',
      name: 'error_occurred_while_restoring',
      desc: '',
      args: [],
    );
  }

  /// `ID:`
  String get id {
    return Intl.message('ID:', name: 'id', desc: '', args: []);
  }

  /// `XXX-XXX-XXX`
  String get device_id_placeholder {
    return Intl.message(
      'XXX-XXX-XXX',
      name: 'device_id_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `File not saved`
  String get file_save_error {
    return Intl.message(
      'File not saved',
      name: 'file_save_error',
      desc: '',
      args: [],
    );
  }

  /// `Password incorrect`
  String get password_incorrect {
    return Intl.message(
      'Password incorrect',
      name: 'password_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `Cannot play this video`
  String get cannot_play_video {
    return Intl.message(
      'Cannot play this video',
      name: 'cannot_play_video',
      desc: '',
      args: [],
    );
  }

  /// `Decryption failed`
  String get decryption_failed {
    return Intl.message(
      'Decryption failed',
      name: 'decryption_failed',
      desc: '',
      args: [],
    );
  }

  /// `Decrypted video path is invalid`
  String get decrypted_path_invalid {
    return Intl.message(
      'Decrypted video path is invalid',
      name: 'decrypted_path_invalid',
      desc: '',
      args: [],
    );
  }

  /// `No video in path`
  String get no_video_in_path {
    return Intl.message(
      'No video in path',
      name: 'no_video_in_path',
      desc: '',
      args: [],
    );
  }

  /// `Cannot play video`
  String get cannot_play_video_error {
    return Intl.message(
      'Cannot play video',
      name: 'cannot_play_video_error',
      desc: '',
      args: [],
    );
  }

  /// `Decryption problem occurred`
  String get decryption_problem {
    return Intl.message(
      'Decryption problem occurred',
      name: 'decryption_problem',
      desc: '',
      args: [],
    );
  }

  /// `File not found`
  String get file_not_found {
    return Intl.message(
      'File not found',
      name: 'file_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Error while extracting IV`
  String get iv_extraction_error {
    return Intl.message(
      'Error while extracting IV',
      name: 'iv_extraction_error',
      desc: '',
      args: [],
    );
  }

  /// `Invalid message`
  String get invalid_message {
    return Intl.message(
      'Invalid message',
      name: 'invalid_message',
      desc: '',
      args: [],
    );
  }

  /// `Decryption failed for chunk`
  String get decryption_failed_for_chunk {
    return Intl.message(
      'Decryption failed for chunk',
      name: 'decryption_failed_for_chunk',
      desc: '',
      args: [],
    );
  }

  /// `Video playback error occurred`
  String get video_playback_error {
    return Intl.message(
      'Video playback error occurred',
      name: 'video_playback_error',
      desc: '',
      args: [],
    );
  }

  /// `Database not initialized successfully`
  String get database_not_initialized {
    return Intl.message(
      'Database not initialized successfully',
      name: 'database_not_initialized',
      desc: '',
      args: [],
    );
  }

  /// `Final file write failed`
  String get final_file_write_failed {
    return Intl.message(
      'Final file write failed',
      name: 'final_file_write_failed',
      desc: '',
      args: [],
    );
  }

  /// `File read error occurred`
  String get file_read_error {
    return Intl.message(
      'File read error occurred',
      name: 'file_read_error',
      desc: '',
      args: [],
    );
  }

  /// `Field cannot be empty`
  String get field_cannot_be_empty {
    return Intl.message(
      'Field cannot be empty',
      name: 'field_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Field cannot contain only spaces`
  String get field_cannot_contain_only_spaces {
    return Intl.message(
      'Field cannot contain only spaces',
      name: 'field_cannot_contain_only_spaces',
      desc: '',
      args: [],
    );
  }

  /// `Save Backup File As`
  String get save_backup_file_as {
    return Intl.message(
      'Save Backup File As',
      name: 'save_backup_file_as',
      desc: '',
      args: [],
    );
  }

  /// `Error: Can not Open this Shared File`
  String get open_shared_file_error {
    return Intl.message(
      'Error: Can not Open this Shared File',
      name: 'open_shared_file_error',
      desc: '',
      args: [],
    );
  }

  /// `An Error Occurred While Generating QR Code.`
  String get error_generate_qr_code {
    return Intl.message(
      'An Error Occurred While Generating QR Code.',
      name: 'error_generate_qr_code',
      desc: '',
      args: [],
    );
  }

  /// `Generate QR Code`
  String get generate_qr_code {
    return Intl.message(
      'Generate QR Code',
      name: 'generate_qr_code',
      desc: '',
      args: [],
    );
  }

  /// `Password Scanner`
  String get title_password_scanner {
    return Intl.message(
      'Password Scanner',
      name: 'title_password_scanner',
      desc: '',
      args: [],
    );
  }

  /// `Let the scan do the magic.\nIt starts on its own!`
  String get msg_scan_instruction {
    return Intl.message(
      'Let the scan do the magic.\nIt starts on its own!',
      name: 'msg_scan_instruction',
      desc: '',
      args: [],
    );
  }

  /// `The file must have ({extension}) extension`
  String file_extension_required(Object extension) {
    return Intl.message(
      'The file must have ($extension) extension',
      name: 'file_extension_required',
      desc: '',
      args: [extension],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
