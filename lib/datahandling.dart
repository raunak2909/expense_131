void main(){


  var data = [
    {
      "class" : "I",
      "sec" : "A",
      "students" : [
        {
          "name" : "Raman",
          "rollno" : 26434,
          "percentile" : 56,
          "marks" : {
            "eng" : 56,
            "maths" : 76
          }
        },

        {
          "name" : "Rajeev",
          "rollno" : 64734,
          "percentile" : 56,
          "marks" : {
            "eng" : 85,
            "maths" : 76
          }
        },

      ]
    },
    {
      "class" : "I",
      "sec" : "B",
      "students" : [
        {
          "name" : "Rajesh",
          "rollno" : 26434,
          "percentile" : 56,
          "marks" : {
            "eng" : 56,
            "maths" : 56
          }
        },

        {
          "name" : "Rahul",
          "rollno" : 64734,
          "percentile" : 56,
          "marks" : {
            "eng" : 56,
            "maths" : 56
          }
        },

      ]
    },
    {
      "class" : "II",
      "sec" : "A",
      "students" : [
        {
          "name" : "Manpreet",
          "rollno" : 26434,
          "percentile" : 56,
          "marks" : {
            "eng" : 56,
            "maths" : 56
          }
        },

        {
          "name" : "Virat",
          "rollno" : 64734,
          "percentile" : 56,
          "marks" : {
            "eng" : {
              "eng A":"56"
            },
            "maths" : 77
          }
        },

      ]
    },
  ];

  print("Marks:");
  var students = data[data.length-1]['students'] as List;
  print("Eng: ${students[students.length-1]['marks']['eng']}");
  print("Maths: ${students[students.length-1]['marks']['maths']}");


  for(Map<String, dynamic> eachClass in data){

    print("${eachClass['class']} ${eachClass['sec']}");


    for(Map<String, dynamic> eachStudent in eachClass['students']){
      print("${eachStudent['name']}");

      print("Marks:");
      print("Eng: ${eachStudent['marks']['eng']}");
      print("Maths: ${eachStudent['marks']['maths']}");
      print("\n");
    }

  }


}