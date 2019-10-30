import 'package:shared_preferences/shared_preferences.dart';
import 'package:valur_game_service_app/models/game_list_filtering_type.dart';

class UserSettings {

  Sport sport;
  Gender gender;
  AgeGroup ageGroup;
  int gameCount;
  List<List<String>> completes;

  UserSettings({
    this.sport,
    this.gender,
    this.ageGroup,
    this.gameCount,
    this.completes,
  });

  UserSettings.init() {
    this.gameCount = 3;
    this.completes = new List<List<String>>();

    this.sport = new Sport(
      football: true,
      handball: true,
    );

    this.gender = new Gender(
      female: true,
      male: true,
    );

    this.ageGroup = new AgeGroup(
      premier: true,
      under23: false,
      group1: false,
      group2: false,
      group3: false,
      group4: false,
      group5: false,
    );

    this.calculateComplete();
  }

  void calculateComplete() {
    this.completes = new List<List<String>>();

    // FOOTBALL - FEMALE:
    if (this.sport.football && this.gender.female && this.ageGroup.premier) { this.completes.add(["101", "football", "female", "111"]); }
    if (this.sport.football && this.gender.female && this.ageGroup.under23) { this.completes.add(["101", "football", "female", "108"]); }
    if (this.sport.football && this.gender.female && this.ageGroup.group1) { this.completes.add(["101", "football", "female", "113"]); }
    if (this.sport.football && this.gender.female && this.ageGroup.group2) { this.completes.add(["101", "football", "female", "109"]); }
    if (this.sport.football && this.gender.female && this.ageGroup.group3) { this.completes.add(["101", "football", "female", "124"]); }
    if (this.sport.football && this.gender.female && this.ageGroup.group4) { this.completes.add(["101", "football", "female", "114"]); }
    if (this.sport.football && this.gender.female && this.ageGroup.group5) { this.completes.add(["101", "football", "female", "420"]); }

    // FOOTBALL - MALE:
    if (this.sport.football && this.gender.male && this.ageGroup.premier) { this.completes.add(["101", "football", "male", "111"]); }
    if (this.sport.football && this.gender.male && this.ageGroup.under23) { this.completes.add(["101", "football", "male", "108"]); }
    if (this.sport.football && this.gender.male && this.ageGroup.group1) { this.completes.add(["101", "football", "male", "113"]); }
    if (this.sport.football && this.gender.male && this.ageGroup.group2) { this.completes.add(["101", "football", "male", "109"]); }
    if (this.sport.football && this.gender.male && this.ageGroup.group3) { this.completes.add(["101", "football", "male", "124"]); }
    if (this.sport.football && this.gender.male && this.ageGroup.group4) { this.completes.add(["101", "football", "male", "114"]); }
    if (this.sport.football && this.gender.male && this.ageGroup.group5) { this.completes.add(["101", "football", "male", "420"]); }

    // HANDBALL - FEMALE:
    if (this.sport.handball && this.gender.female && this.ageGroup.premier) { this.completes.add(["453", "handball", "female", "111"]); }
    //if (this.sport.handball && this.gender.female && this.ageGroup.under23) { this.completes.add(["453", "handball", "female", "108"]); }
    if (this.sport.handball && this.gender.female && this.ageGroup.group1) { this.completes.add(["453", "handball", "female", "113"]); }
    if (this.sport.handball && this.gender.female && this.ageGroup.group2) { this.completes.add(["453", "handball", "female", "109"]); }
    if (this.sport.handball && this.gender.female && this.ageGroup.group3) { this.completes.add(["453", "handball", "female", "124"]); }
    if (this.sport.handball && this.gender.female && this.ageGroup.group4) { this.completes.add(["453", "handball", "female", "114"]); }
    //if (this.sport.handball && this.gender.female && this.ageGroup.group5) { this.completes.add(["453", "handball", "female", "420"]); }

    // HANDBALL - MALE:
    if (this.sport.handball && this.gender.male && this.ageGroup.premier) { this.completes.add(["453", "handball", "male", "111"]); }
    //if (this.sport.handball && this.gender.male && this.ageGroup.under23) { this.completes.add(["453", "handball", "male", "108"]); }
    if (this.sport.handball && this.gender.male && this.ageGroup.group1) { this.completes.add(["453", "handball", "male", "113"]); }
    if (this.sport.handball && this.gender.male && this.ageGroup.group2) { this.completes.add(["453", "handball", "male", "109"]); }
    if (this.sport.handball && this.gender.male && this.ageGroup.group3) { this.completes.add(["453", "handball", "male", "124"]); }
    if (this.sport.handball && this.gender.male && this.ageGroup.group4) { this.completes.add(["453", "handball", "male", "114"]); }
    //if (this.sport.handball && this.gender.male && this.ageGroup.group5) { this.completes.add(["453", "handball", "male", "420"]); }

  }

  void load(List<String> sports, List<String> genders, List<String> ageGroups) {
    if (sports.length > 0) {
      this.sport = new Sport(
        football: sports[0] == "1",
        handball: sports[1] == "1"
      );
    }

    if (genders.length > 0) {
      this.gender = new Gender(
        female: genders[0] == "1",
        male: genders[1] == "1",
      );
    }

    if (ageGroups.length > 0) {
      this.ageGroup = new AgeGroup(
        premier: ageGroups[0] == "1",
        under23: ageGroups[1] == "1",
        group1: ageGroups[2] == "1",
        group2: ageGroups[3] == "1",
        group3: ageGroups[4] == "1",
        group4: ageGroups[5] == "1",
        group5: ageGroups[6] == "1",
      );
    }

    this.calculateComplete();
  }

}

class Sport {

  bool football;
  bool handball;

  Sport({
    this.football,
    this.handball,
  });

}

class Gender {

  bool female;
  bool male;

  Gender({
    this.female,
    this.male,
  });

}

class AgeGroup {

  bool premier;
  bool under23;
  bool group1;
  bool group2;
  bool group3;
  bool group4;
  bool group5;

  AgeGroup({
    this.premier,
    this.under23,
    this.group1,
    this.group2,
    this.group3,
    this.group4,
    this.group5,
  });

}