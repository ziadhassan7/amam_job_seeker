//---
class ResumeDataModel {
  String? status;
  Data? data;

  ResumeDataModel({this.status, this.data,});

  ResumeDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

//---
class Data {
  Name? name;
  List<Email>? email;
  List<Employer>? employer;
  List<Education>? education;
  List<Phone>? phone;
  String? skillsHeading;
  Address? address;
  Skills? skills;

  Data(
      {this.name,
        this.email,
        this.employer,
        this.education,
        this.phone,
        this.skillsHeading,
        this.address,
        this.skills});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    if (json['email'] != null) {
      email = <Email>[];
      json['email'].forEach((v) {
        email!.add(Email.fromJson(v));
      });
    }
    if (json['employer'] != null) {
      employer = <Employer>[];
      json['employer'].forEach((v) {
        employer!.add(Employer.fromJson(v));
      });
    }
    if (json['education'] != null) {
      education = <Education>[];
      json['education'].forEach((v) {
        education!.add(Education.fromJson(v));
      });
    }
    if (json['phone'] != null) {
      phone = <Phone>[];
      json['phone'].forEach((v) {
        phone!.add(Phone.fromJson(v));
      });
    }
    skillsHeading = json['skills_heading'];
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    skills =
    json['skills'] != null ? Skills.fromJson(json['skills']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (email != null) {
      data['email'] = email!.map((v) => v.toJson()).toList();
    }
    if (employer != null) {
      data['employer'] = employer!.map((v) => v.toJson()).toList();
    }
    if (education != null) {
      data['education'] = education!.map((v) => v.toJson()).toList();
    }
    if (phone != null) {
      data['phone'] = phone!.map((v) => v.toJson()).toList();
    }
    data['skills_heading'] = skillsHeading;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (skills != null) {
      data['skills'] = skills!.toJson();
    }
    return data;
  }
}

//---
class Name {
  String? fullName;

  Name({this.fullName,});

  Name.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = fullName;
    return data;
  }
}

//---
class Email {
  String? email;

  Email({this.email});

  Email.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }
}

//---
class Employer {
  String? companyName;
  String? role;
  String? description;

  Employer({this.companyName, this.role, this.description,});

  Employer.fromJson(Map<String, dynamic> json) {
    companyName = json['company_name'];
    role = json['role'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_name'] = companyName;
    data['role'] = role;
    data['description'] = description;
    return data;
  }
}

//---
class Education {
  String? institute;
  String? degree;
  String? course;

  Education({this.institute, this.degree, this.course});

  Education.fromJson(Map<String, dynamic> json) {
    institute = json['institute'];
    degree = json['degree'];
    course = json['course'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['institute'] = institute;
    data['degree'] = degree;
    data['course'] = course;
    return data;
  }
}

//---
class Phone {
  String? phone;

  Phone({this.phone});

  Phone.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    return data;
  }
}

//---
class Address {
  String? city;
  String? countryCode;
  String? sSource;

  Address({this.city, this.countryCode, this.sSource});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    countryCode = json['country_code'];
    sSource = json['_source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['country_code'] = countryCode;
    data['_source'] = sSource;
    return data;
  }
}

//---
class Skills {
  List<String>? overallSkills;

  Skills({this.overallSkills});

  Skills.fromJson(Map<String, dynamic> json) {
    overallSkills = json['overall_skills'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['overall_skills'] = overallSkills;
    return data;
  }
}