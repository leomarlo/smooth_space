import {etudePartIComplexityScientist} from '../texts/DieStimmungSetztSich.js'
import {etudeTeil1Hanne} from '../texts/EtudeTeil1Hanne.js'
import {damienText1} from '../texts/Damien.js'
import {damienText2} from '../texts/Damien2.js'
let BaseSize = 10
let SizeFactor = 20;

let reParantheses = /\(([^)]+)\)/;
var reCurlyBracketLeft = /^\s*{\s*$/;
var reCurlyBracketRight = /^\s*}\s*$/;
var reEmptyLine = /^\s*$/;

let playState = {}

function getNode(n, v) {
    n = document.createElementNS("http://www.w3.org/2000/svg", n);
    for (var p in v)
        n.setAttributeNS(null, p, v[p]);
    return n
}

function getTextNode(text, v) {
    const node = getNode("g",{})
    const textNode = getNode("text", v)
    text = document.createTextNode(text);
    textNode.appendChild(text)
    node.appendChild(textNode)
    return node
}

function getMP4Video(src, tx, ty, scx, scy, x, y, width, height, id ){
    const n = getNode("g", {transform:`translate(${tx},${ty}) scale(${scx}, ${scy})`})
    const fO = getNode("foreignObject", {"x": x, "y": y, "width": width, "height": height})
    const vid = document.createElement("video")
    vid.setAttribute("id", id)
    vid.setAttribute("width", width)
    vid.setAttribute("height", height)
    vid.setAttribute("loop", "")
    vid.setAttribute("muted","")
    vid.setAttribute("autoplay","")
    vid.setAttribute("style", '"position: fixed; left: 0px; top: 0px;"')
    vid.setAttribute("xmlns", "http://www.w3.org/1999/xhtml")
    // const vid = getNode("video", {"id": id, "width": width, "xmlns": "http://www.w3.org/1999/xhtml", "style": "position: fixed; left: 0px; top: 0px;", loop:"", muted:"", autoplay:""})
    const sourceNode = document.createElement("source")
    sourceNode.setAttribute("src", src)
    sourceNode.setAttribute("type", "video/mp4")
    // src = getNode("source", {"src":src, type:"video/mp4"})
    vid.appendChild(sourceNode)
    fO.appendChild(vid)
    n.appendChild(fO)
    // vid.play()
    return n
}



function parse(text){

    let textContent = new Array()
    let indices = {}
    let thisLevelChildren  = {}
    let rows = text.split('\n')
    let level = 0
    let topic = 0
    let emptyLines = 0
    let id = ""
    let parent = ""
    for (let i=0; i<rows.length; i++){
       console.log(`What about row number ${i}: ${rows[i]}`)
        // let levelUpFlag = false
        let curlyLeft = reCurlyBracketLeft.exec(rows[i])
        if (curlyLeft) {
            // levelUpFlag = true
            level ++;
            parent = (textContent[indices[id]].areVerbs) ? 
                    textContent[indices[id]].verbsBelongTo:
                    id;
            continue;
        }
        let curlyRight = reCurlyBracketRight.exec(rows[i])
        if (curlyRight) {
            textContent[indices[parent]].children = thisLevelChildren[level]
            thisLevelChildren[level] = []
            parent = textContent[indices[parent]].parent;
            level --;
            continue;
            // resetting parent comes at the end of the body
        }
        // console.log('Its not { or }')
        let emptyLine = reEmptyLine.exec(rows[i])
        if (emptyLine) {
            if (emptyLines==1) topic ++;
            emptyLines ++;
            continue
        } else {
            emptyLines = 0;
        }
        // console.log('Its not just spaces')
        let match = reParantheses.exec(rows[i])
        if (match){
            id = match[0];
            let lastId = textContent[textContent.length - 1].id
            textContent.push({
                "verbsBelongTo": lastId,
                "areVerbs": true,
                "level": level,
                "parent": parent,
                "children": [],
                "id": id,
                "text": match[0],
                "topic": topic})
        } else {
            id = rows[i]
            textContent.push({
                "verbsBelongTo": "",
                "areVerbs": false,
                "level": level,
                "parent": parent,
                "children": [],
                "id": id,
                "text": rows[i],
                "topic": topic})
        }

        if (level>0){
            if(thisLevelChildren[level]){
                thisLevelChildren[level].push(id) 
            } else {
                thisLevelChildren[level] = [id]
            }
        }

        console.log(' level is ', level)


        // set the inverse mapping from id to index
        indices[id] = textContent.length - 1


    }
    return textContent
}


function fillTextContent(svg, rawText, x0, y0, width, yspacing_min, yspacing_max){
    let parsed = parse(rawText)
    // console.log(parsed)
    // first the elements
    let y = y0;
    
    let x = 0;
    for (let row of parsed){
        x = x0 + Math.random() * width;
        let fontSize = BaseSize + SizeFactor * (2 ** (- row.level))
        let textNode = getTextNode(
            row.text,
            {id:row.id, x:x.toString(), y:y.toString(), 
            style:`font-style:thick; 
                font-weight:2px; font-size:${Math.round(fontSize)}px; fill:#000000; line-height:1.25;
                fill-opacity:1;
                stroke:none;
                stroke-width:0.26458332"`})
        svg.appendChild(textNode)

        y += yspacing_min + Math.random() * (yspacing_max - yspacing_min);
    }
    // the the event listeners
    
}

function addEventListenersToTextElements(rawText) {
    let parsed = parse(rawText)

    for (let row of parsed){
        if (row.children){
            let parent = document.getElementById(row.id)
            console.log(`the parent of ${row.id} is ${parent}.`)
            parent.addEventListener('click',()=>{
                for (let child of row.children){
                    // console.log(`The child of "${row.id}" is "${child}"\n`)
                    let element = document.getElementById(child)
                    element.setAttribute("display", 
                        (element.getAttribute("display")=="none") ? 
                        "inline" : "none");
                }
            })
        }
    }
}

const svg = getNode("svg", {height: "2400", width: "2400", viewBox: "0 0 5400 5400"})

let threeByThreeVideo = "vid/ThreeByThreeComposition.webm"
// let threeByThreeVideo = "vid/Clip Pedal2.mp4"
// let threeByThreeVideo ="https://drive.google.com/file/d/1wIQ90owJgOfc-CIXsorR0VLy9fjPnU4M/view?usp=sharing"
// let threeByThreeVideo = "https://en.wikipedia.org/wiki/Butterfly_stroke#/media/File:Butterfly_stroke3_without_text.gif"
playState[threeByThreeVideo] = false
svg.appendChild(getMP4Video(threeByThreeVideo, "0", "0", "1.0", "1.0", "500", "1730", "1800", "1100", threeByThreeVideo))

let pedalVideo = "vid/Clip Pedal.mp4"
playState[pedalVideo] = false
svg.appendChild(getMP4Video(pedalVideo, "0", "0", "1.0", "1.0", "30", "510", "500", "400", pedalVideo))

let verbenVideo = "vid/Version 1.2 mit Verben.mp4"
// let verbenVideo = "vid/Clip Pedal3.mp4"
playState[verbenVideo] = false
svg.appendChild(getMP4Video(verbenVideo, "0", "0", "1.0", "1.0", "3800", "470", "1500", "1100", verbenVideo))


let leoVerbenVideo = "vid/Splittscreen mit Leos Verben.mp4"
// let leoVerbenVideo = "vid/Clip Pedal4.mp4"
playState[leoVerbenVideo] = false
svg.appendChild(getMP4Video(leoVerbenVideo, "0", "0", "1.0", "1.0", "2200", "490", "1500", "1100", leoVerbenVideo))


fillTextContent(svg, etudePartIComplexityScientist, 540, 140, 700, 33, 73)
fillTextContent(svg, damienText1, 2340, 20, 850, 33, 73)
fillTextContent(svg, etudeTeil1Hanne, 2540, 1510, 500, 33, 73)
fillTextContent(svg, damienText2, 140, 2820, 3630, 33, 73)
document.body.appendChild(svg)
addEventListenersToTextElements(etudePartIComplexityScientist)
addEventListenersToTextElements(etudeTeil1Hanne)
document.getElementById(verbenVideo).addEventListener("click", ()=>{
    if (playState[verbenVideo]){
        document.getElementById(verbenVideo).pause()
        playState[verbenVideo] = false
    } else {
        document.getElementById(verbenVideo).play();
        playState[verbenVideo] = true
    }
});

document.getElementById(threeByThreeVideo).addEventListener("click", ()=>{
    if (playState[threeByThreeVideo]){
        document.getElementById(threeByThreeVideo).pause()
        playState[threeByThreeVideo] = false
    } else {
        document.getElementById(threeByThreeVideo).play();
        playState[threeByThreeVideo] = true
    }
});

document.getElementById(pedalVideo).addEventListener("click", ()=>{
    if (playState[pedalVideo]){
        document.getElementById(pedalVideo).pause()
        playState[pedalVideo] = false
    } else {
        document.getElementById(pedalVideo).play();
        playState[pedalVideo] = true
    }
});


document.getElementById(leoVerbenVideo).addEventListener("click", ()=>{
    if (playState[leoVerbenVideo]){
        document.getElementById(leoVerbenVideo).pause()
        playState[leoVerbenVideo] = false
    } else {
        document.getElementById(leoVerbenVideo).play();
        playState[leoVerbenVideo] = true
    }
});



// document.getElementById("verben").addEventListener("click", ()=>{
//     document.getElementById("hoo").play()
// })