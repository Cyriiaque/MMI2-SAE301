<div data-id="{{name}}" class="m-2 p-2 flex sm:flex-row flex-col gap-4 max-w-screen justify-center sm:items-start items-center">
    <div>
        <img id="image" src="{{image}}" alt="image produit" class="w-auto h-80 object-cover">
    </div>
    
    <div class="flex flex-col gap-2 max-w-96">
        <h2 id="className" class="hidden">{{type}}</h2>
        <h2  class="text-black-color font-semibold text-2xl ">{{name}}
        </h2>
        
        <h3 class="text-grey-color font-semibold text-sm">{{subtitle}}</h3>
        <h2  class="text-black-color font-semibold text-xl" id="price-value"><span id="price-value">{{price}}</span>€
        </h2>
        <h2 class="hidden" id="promo"><span id="promo-value">{{promo}}</span>€</h2>
        <section class="gap-2 flex flex-row" id="color"></section>
        <div class="flex justify-center items-center flex-col gap-2">
            <h3 class="text-black-color font-semibold">Sélectionner la taille
            </h3>
            <div class="relative group">
                <select id="sizes">
                </select>
            </div>
            <h3 class="text-black-color font-medium flex gap-2 justify-center items-center"><svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" viewBox="0 0 24 24" role="img" width="24px" height="24px" fill="none"><path stroke="currentColor" stroke-width="1.5" d="M21.75 10.5v6.75a1.5 1.5 0 01-1.5 1.5H3.75a1.5 1.5 0 01-1.5-1.5V10.5m3.308-2.25h12.885"/><path stroke="currentColor" stroke-width="1.5" d="M15.79 5.599l2.652 2.65-2.652 2.653M8.21 5.599l-2.652 2.65 2.652 2.653M17.25 19v-2.5M12 19v-2.5M6.75 19v-2.5"/>
            </svg>Guide des tailles
            </h3>
            <form method='POST' action="../api/cart/add" id="addToCart" class="flex flex-col w-96 mt-12">
                <input type="number" name="id_order" placeholder="Saisir le panier"
                    class="h-8 mt-4 border border-black text-black hidden">
                <input type="number" name="id_product" placeholder="Saisir le produit"
                    class="h-8 mt-4 border border-black text-black hidden">
                <button type="submit" name="action" id="addcart" class="h-8 bg-black-color text-white-color py-2 px-3 rounded-full flex justify-center items-center">
                    Ajouter au panier</button>
            </form>
        </div>
        <h3 class="text-black-color font-semibold text-sm">Retrait gratuit
        </h3>
        <h3 class="text-black-color font-semibold text-sm">Trouver un magasin
        </h3>
        <p class="text-grey-color font-semibold text-sm">
            Option « click and collect » disponible au moment du paiement  
        </p>
        <p class="text-black-color font-semibold text-sm"></p>
        La vitesse est ton obsession ? C'est aussi celle des plus grandes stars du foot. Cette chaussure à crampons Elite avec unité Air Zoom 3/4 améliorée a été conçue pour ça. Elle te donne la sensation de propulsion nécessaire pour percer la défense et imiter les joueurs et joueuses les plus rapides. Résultat : c'est la Mercurial la plus réactive de toutes. Parce que tu mérites l'excellence, pour toi-même et tes chaussures.
        </p>
    </div>
</div>