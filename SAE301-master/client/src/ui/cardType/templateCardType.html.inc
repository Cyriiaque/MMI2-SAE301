<article class="flex flex-row flex-wrap" data-id="{{id_product}}">
    <div class="flex flex-col static w-full" id="promotion">
        <div class="relative">
            <img class="w-full h-60 object-cover" src="{{image}}" alt="Chaussure">
            <h3 id="promo" class="block py-2 px-3 text-black-color bg-white-color absolute bottom-4 left-4 rounded">
                <span id="promo-value">{{promo}}</span>%
            </h3>
        </div>
        <h3 class="block py-2 px-3 font-medium text-black-color rounded">{{name}}</h3>
        <h3 class="block py-2 px-3 font-medium text-grey-color rounded">{{subtitle}}</h3>
        <div class="flex flex-row gap-2">
            <h2 class="font-semibold py-2 px-3" id="price"><span id="price-value">{{price}}</span>€</h2>
            <h3 class="text-red-color text-3xl" id="newprice"></h3>
        </div>
    </div>
</article>

