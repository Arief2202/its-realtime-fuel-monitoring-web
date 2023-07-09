$("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
  });

$("#wrapper").toggleClass("toggled");

window.onkeyup = function(e){
  if(e.keyCode == 66 && e.ctrlKey || e.keyCode == 27){
    $("#wrapper").toggleClass("toggled");
  }
}