import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  bool isEn = true;

  Map<String, Object> textsAr = {
    "bar_name": "ملاحظات",
    "bar2_name": "تعديل ملاحظة",
    "button": "إضافة",
    "f_F": "العنوان",
    "s_F": "المحتوى",
    "show_e": 'تم تعديل الملاحظة',
    "show_d": 'تم حذف الملاحظة',
    "show_a": 'تم إضافة ملاحظة',
    "no_n": 'لا يوجد ملاحظات',
    "no_r": 'لا يوجد نتائج',
    "bar_s": 'بحث',
  };
  Map<String, Object> textsEn = {
    "bar_name": "Notes",
    "bar2_name": "Edit Note",
    "button": "Add",
    "f_F": "Title",
    "s_F": "Content",
    "show_e": 'Note is edited',
    "show_d": 'Note is deleted',
    "show_a": 'Note is added',
    "no_n": 'No notes yet',
    "no_r": 'No Results',
    "bar_s": 'Search',
  };

  changeLan() {
    isEn = !isEn;
    emit(LanguageIsChanged());
  }

  getTexts(String txt) {
    if (isEn == true) {
      return textsEn[txt];
    } else {
      return textsAr[txt];
    }
  }
}
