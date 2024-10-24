import { genericRenderer } from "../../lib/utils.js";

const templateFile = await fetch("src/ui/panier/templatepanier.html.inc");
const template = await templateFile.text();

let PanierView = {
  render: function (data) {
    let html = "";
    for (let obj of data) {
      html += genericRenderer(template, obj);
    }
    return html;
  },
};

export { PanierView };