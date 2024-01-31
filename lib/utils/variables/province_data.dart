class ProvinceData {
  static const Map<String, dynamic> data = {
    "provinces": [
      {
        "name": "DKI Jakarta",
        "cities": [
          {
            "name": "Jakarta Pusat",
            "kecamatan": [
              {
                "name": "Gambir",
                "kelurahan": ["Petojo Utara", "Petojo Selatan", "Gambir", "Karang Anyar"]
              },
              {
                "name": "Tanah Abang",
                "kelurahan": ["Kebon Kacang", "Kampung Bali", "Bendungan Hilir", "Karet Tengsin"]
              }
            ]
          },
          {
            "name": "Jakarta Barat",
            "kecamatan": [
              {
                "name": "Kebon Jeruk",
                "kelurahan": ["Srengseng", "Kedoya Utara", "Kedoya Selatan", "Green Garden"]
              },
              {
                "name": "Palmerah",
                "kelurahan": ["Kemanggisan", "Jatipulo", "Slipi", "Tanjung Duren Utara"]
              }
            ]
          }
        ]
      },
      {
        "name": "Jawa Barat",
        "cities": [
          {
            "name": "Bandung",
            "kecamatan": [
              {
                "name": "Bandung Wetan",
                "kelurahan": ["Citarum", "Kebon Jayanti", "Braga", "Babakan Ciamis"]
              },
              {
                "name": "Bandung Kidul",
                "kelurahan": ["Cibuntu", "Cihapit", "Citarum", "Sukabungah"]
              }
            ]
          },
          {
            "name": "Cimahi",
            "kecamatan": [
              {
                "name": "Cimahi Selatan",
                "kelurahan": ["Cimahi Tengah", "Cimahi Utara", "Cimahi Selatan", "Cimahi Tenggara"]
              },
              {
                "name": "Cimahi Utara",
                "kelurahan": ["Cimahi Kota", "Cimahi Selatan", "Cimahi Timur", "Cimahi Barat"]
              }
            ]
          }
        ]
      }
    ]
  };
}
