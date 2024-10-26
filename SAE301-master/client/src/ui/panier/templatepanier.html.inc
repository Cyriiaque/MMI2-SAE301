<article
  class="border-solid border-2 border-light-grey-color m-2 p-2 flex sm:flex-row flex-col gap-4 max-w-4xl"
  data-id="{{id_product}}"
>
  <img
    src="{{image}}"
    alt="image produit"
    class="w-auto h-80 sm:w-60 sm:h-60 object-cover"
  />
  <div class="flex flex-col gap-2 w-full" id="promotion">
    <div
      class="text-black-color font-semibold text-lg flex justify-between gap-2 relative"
    >
      <h2 class="text-sm md:text-xl">{{name}}</h2>
      <h2 class="text-sm md:text-xl" id="price">
        <span id="price-value">{{price}}</span>€
      </h2>
      <h2 class="hidden" id="promo">
        <span id="promo-value">{{promo}}</span>€
      </h2>
      <h2 class="hidden" id="stock">{{stock}}</h2>
      <h2
        id="labelPromo"
        class="hidden bg-black-color text-white-color px-2 py-1 rounded absolute -top-8 -right-8"
      >
        -20%
      </h2>
    </div>

    <h3 class="text-grey-color font-semibold md:text-lg text-sm">
      {{subtitle}}
    </h3>
    <p class="text-grey-color font-medium md:text-lg text-sm">
      Taille / Pointure : {{size}}{{shoesize}}
    </p>
    <p class="text-grey-color font-medium md:text-lg text-sm">
      Options de cadeau
    </p>

    <div class="flex flex-row items-center gap-2">
      <form
        method="DELETE"
        action="../api/cart/del"
        class="flex flex-col mt-12"
      >
        <input
          type="number"
          name="id_order"
          placeholder="Saisir le panier"
          class="h-8 mt-4 border border-black text-black hidden"
        />
        <input
          type="number"
          name="id_product"
          placeholder="Saisir le produit"
          class="h-8 mt-4 border border-black text-black hidden"
          value="{{id_product}}"
        />
        <button
          type="submit"
          name="action"
          id="delcart"
          class="h-8 bg-black-color text-white-color py-2 px-3 rounded-full flex justify-center items-center"
        >
          -
        </button>
      </form>
      <h1 id="quantity">{{quantity}}</h1>
      <form
        method="POST"
        action="../api/cart/add"
        class="flex flex-col mt-12"
      >
        <input
          type="number"
          name="id_order"
          placeholder="Saisir le panier"
          class="h-8 mt-4 border border-black text-black hidden"
        />
        <input
          type="number"
          name="id_product"
          placeholder="Saisir le produit"
          class="h-8 mt-4 border border-black text-black hidden"
          value="{{id_product}}"
        />
        <button
          type="submit"
          name="action"
          id="addcart"
          class="h-8 bg-black-color text-white-color py-2 px-3 rounded-full flex justify-center items-center"
        >
          +
        </button>
      </form>
    </div>
  </div>
</article>
