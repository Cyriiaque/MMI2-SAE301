<article class="flex flex-row flex-wrap">
    <div class="flex flex-col static w-60">
        <div class="relative">
            <img class="w-60 h-60 object-cover" src="{{image}}" alt="Chaussure" >
            <h3 id="promo" class="block py-2 px-3 text-black-color bg-white-color absolute bottom-4 left-4 rounded"><span id="promo-value">{{promo}}</span>%</h3>
        </div>
        <h3 class="block py-2 px-3 font-medium text-black-color rounded">
            {{name}}
        </h3>
        <h3 class="block py-2 px-3 font-medium text-grey-color rounded">
            {{subtitle}}
        </h3>
        <div class="flex justify-start items-center">
            <div class="h-4 w-4 rounded-full bg-{{color}}-color border-solid border-2 border-black-color"></div>
        </div>
        <h1 class="font-semibold py-2 px-3">{{price}}€</h1>
    </div>
</article>