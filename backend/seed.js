const mongoose = require("mongoose");
const City = require("./models/city.model");

mongoose
  .connect(
    "mongodb+srv://123:Adidas123@cluster0.vyfne.mongodb.net/MaghrebTravel?retryWrites=true&w=majority",
    {
      useNewUrlParser: true,
      useUnifiedTopology: true
    }
  )
  .then(() => {
    Promise.all([
      new City({
        name: "Algerie ",
        image: "http://10.0.2.2/assets/images/Algerie.png",
        activities: [
          {
            image: "http://10.0.2.2/assets/images/activities_algerie/makam.jpg",
            name: "Makkam Cha3id",
            id: "a1",
            city: "Alger",
            price: 12.0
          },
          {
            image: "http://10.0.2.2/assets/images/activities_algerie/mosquée.jpg",
            name: "Grande Mosqué d'Alger",
            id: "a2",
            city: "Alger",
            price: 0.0
          },
          {
            image: "http://10.0.2.2/assets/images/activities_algerie/taddart.jpg",
            name: "Taddart Rouge",
            city: "Sud Algerien",
            id: "a3",
            price: 0.0
          },
        ]
      }).save(),
      new City({
        name: "Maroc",
        image: "http://10.0.2.2/assets/images/maroc.gif",
        activities: [
          {
            image: "http://10.0.2.2/assets/images/activities_maroc/mosque.jpg",
            name: "Mosquée Hassan II",
            id: "m1",
            city: "Maroc",
            price: 100.0
          },
          {
            image:
              "http://10.0.2.2/assets/images/activities_maroc/surf.jpg",
            name: "Surf",
            id: "m2",
            city: "Tanger",
            price: 0.0
          },
          {
            image:
              "http://10.0.2.2/assets/images/activities_maroc/gorges_de_Dadès.jpg",
            name: "Gorges de Dadès",
            id: "m3",
            city: "Dadès",
            price: 10.0
          },
        ]
      }).save(),
      new City({
        name: "Tunisie",
        image: "http://10.0.2.2/assets/images/tunisie.gif",
        activities: [
          {
            image:
              "http://10.0.2.2/assets/images/activities/fort_hammamet.jpg",
            name: "Fort de Hammamet",
            id: "t1",
            city: "Hammemet",
            price: 5.0
          },
          {
            image: "http://10.0.2.2/assets/images/activities/friguia_park.jpg",
            name: "Friguia Park",
            id: "t2",
            city: "Tunis",
            price: 0.0
          },
          {
            image:
              "http://10.0.2.2/assets/images/activities/plage.jpg",
            name: "Plage",
            id: "t3",
            city: "Sous",
            price: 0.0
          },
        ]
      }).save()
    ]).then(res => {
      console.log("data installed");
      mongoose.connection.close();
    });
  });
