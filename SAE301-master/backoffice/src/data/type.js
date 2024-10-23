import { getRequest } from "../lib/api-request.js";

let TypeCardData = {};

let fakeTypeCard = [
    {
        id: 1,
        name: "Pain",
        image: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d56ebd9e-15f9-4aa3-9e52-c23f5b5c5930/M+NK+DF+STRK+TOP+SS.png",
        subtitle: "Un pain frais et croustillant.",
        price: 1.20,
        promo: 40,
        type: "Chaussure"
    },
    {
        id: 2,
        name: "Lait",
        image: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d56ebd9e-15f9-4aa3-9e52-c23f5b5c5930/M+NK+DF+STRK+TOP+SS.png",
        subtitle: "Lait entier de haute qualité.",
        price: 0.99,
        promo: 10,
        type: "Tshirt"
    },
    {
        id: 3,
        name: "Beurre",
        image: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d56ebd9e-15f9-4aa3-9e52-c23f5b5c5930/M+NK+DF+STRK+TOP+SS.png",
        subtitle: "Beurre doux et crémeux.",
        price: 2.50,
        promo: 10,
        type: "Short"
    },
    {
        id: 4,
        name: "Farine",
        image: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d56ebd9e-15f9-4aa3-9e52-c23f5b5c5930/M+NK+DF+STRK+TOP+SS.png",
        subtitle: "Farine de blé de haute qualité.",
        price: 1.00,
        promo: 50,
        type: "Chaussure"
    },
];

TypeCardData.fetch = async function (id) {
    let data = await getRequest("category/" + id);
    return data == false ? fakeTypeCard.pop() : [data];
};
  
TypeCardData.fetchAll = async function (type) {
    let data = await getRequest("category/" + type);
     return data == false ? fakeTypeCard : data;
};

export { TypeCardData };
