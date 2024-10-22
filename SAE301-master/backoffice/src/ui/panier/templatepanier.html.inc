<article class="border-solid border-2 border-light-grey-color m-2 p-2 flex sm:flex-row flex-col gap-4 max-w-4xl">
    <img src="{{image}}" alt="image produit" class="w-auto h-80 sm:w-60 sm:h-60 object-cover">
    <div class="flex flex-col gap-2 w-full ">
        <div class="text-black-color font-semibold text-lg flex justify-between gap-2">
            <h2 class="text-sm md:text-xl">{{name}}</h2>
            <h2 class="text-sm md:text-xl">{{price}} €</h2>
        </div>
        
        <h3 class="text-grey-color font-semibold md:text-lg text-sm">{{subtitle}}</h3>
        <div class="flex gap-2" id="color">
            <div class="h-4 w-4 border-solid border-2 border-black-color rounded-full bg-{{color}}-color"></div>          
        </div>
        <p  class="text-grey-color font-medium md:text-lg text-sm">Taille / Pointure : {{size}}{{shoesize}}</p>
        <p  class="text-grey-color font-medium md:text-lg text-sm">Options de cadeau</p>
        <svg width="19" height="22" viewBox="0 0 19 22" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M11.25 6.25V18.25M6.75 6.25V18.25M2.25 4.75V18.25C2.25 19.49 3.26 20.5 4.5 20.5H13.5C14.74 20.5 15.75 19.49 15.75 18.25V4M15.75 4H18.5M15.75 4H18M6 1H11.25C12.08 1 12.75 1.67 12.75 2.5C12.75 3.33 12.08 4 11.25 4H0" stroke="black" stroke-width="1.5" stroke-miterlimit="10"/>
            
        </svg>
        <button id="quantityplus" name="quantityplus">+</button>
        <h1 id="quantity">{{quantity}}</h1>
        <button id="quantitymoins" name="quantitymoins">-</button>
    </div>
</article>