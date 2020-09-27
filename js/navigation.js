function navigation_adjust() {
  var self=this;
  this.sidenav = document.getElementById("project_sidenav");
  this.cardstr = 'card';
  this.cardelm = this.sidenav.querySelectorAll("."+this.cardstr);
  this.focus_dom = function(event) {
    var current_node = event.target;
    for (var domel=0; domel<=100; domel++) {
      var is_some_card_dom = current_node.className.slice(0,self.cardstr.length)==self.cardstr;
      var is_sub_card_dom = current_node.className[self.cardstr.length]=="-";
      if (is_some_card_dom && !is_sub_card_dom) {
        var ref_id = current_node.id.split("lette");
        document.getElementById(ref_id[0]).scrollIntoView({behavior: 'smooth'})
        break;
      } else {
        current_node = current_node.parentNode;
      }
    }
    return null
  }
  this.all_cards_scroll_into_view = () => {
    for (var ix = 0; ix < this.cardelm.length; ix++) {
      this.cardelm[ix].addEventListener("click", this.focus_dom);
    };
    return null
  }
}

export {navigation_adjust};
