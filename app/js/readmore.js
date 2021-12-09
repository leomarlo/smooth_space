read_mores = document.getElementsByClassName("read_more_");
// console.log('read_mores ', read_mores)


console.log('hallo')

for (let i=0; i<read_mores.length; i++) {
    read_mores[i].addEventListener("click", (event)=>{
    let parent = read_mores[i].parentNode;
    if (parent.isExpanded){
        
        read_mores[i].children[0].innerText = 'Read More'
        read_mores[i].style["height"] = "100px";
        parent.style["height"] = "120px"
        parent.style["max-height"] = "120px"
        parent.isExpanded = false
        return null
    }

    let totalHeight = 0;
    let paragraphsHeight = 0;
    read_mores[i].style["height"] = "50px";
    let paragraphs = parent.children;
    console.log('here come the children: ', paragraphs)
    for (let i=0; i<paragraphs.length; i++) {
        totalHeight += paragraphs[i].offsetHeight + 15
        if (paragraphs[i].className){
            if (paragraphs[i].className.split(" ").includes("read_more_")) {
                continue
            }
        }
        paragraphsHeight += paragraphs[i].offsetHeight
        
    }
    parent.style.height = totalHeight + 'px';
    parent.style["max-height"] = '9999px'
    read_mores[i].children[0].innerText = 'Read Less'
    parent.isExpanded = true
    });
}