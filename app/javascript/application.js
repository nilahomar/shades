// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import * as Turbo from "@hotwired/turbo"
// export { Turbo }
import "./controllers"
import "bootstrap"


document.addEventListener("turbo:load", () => {
  dragElement(document.getElementById("color-selector"));
  colorElement(document.getElementById("shade-pick"));
})

Turbo.scroll = {};

document.addEventListener("turbo:load", ()=> {

  const elements = document.querySelectorAll("[data-turbolinks-scroll]");

  elements.forEach(function(element){

    element.addEventListener("click", ()=> {
      Turbo.scroll['top'] = document.scrollingElement.scrollTop;
    });

    element.addEventListener("submit", ()=> {
      Turbo.scroll['top'] = document.scrollingElement.scrollTop;
    });

  });

  if (Turbo.scroll['top']) {
    document.scrollingElement.scrollTo(0, Turbo.scroll['top']);
  }

  Turbo.scroll = {};
});


function dragElement(elmnt) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  elmnt.onmousedown = dragMouseDown;

  function dragMouseDown(e) {
    e = e || window.event;
    e.preventDefault();
    // get the mouse cursor position at startup:
    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    // call a function whenever the cursor moves:
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();
    // calculate the new cursor position:
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    // set the element's new position:
    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
  }

  function closeDragElement() {
    // stop moving when mouse button is released:
    document.onmouseup = null;
    document.onmousemove = null;
  }
}


function colorElement(elmnt) {
  elmnt.addEventListener("mouseover", (event) => {
    document.getElementById("color-selector").style.backgroundColor = event.target.style.backgroundColor;
  });
}
