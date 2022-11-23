import {
    getNode,
    getTextNode
} from './canvasUtils.js'



const canvas = getNode("svg", {height: "2400", width: "2400", viewBox: "0 0 5400 5400"})
let playState = {}

let pedalVideo = "vid/Clip Pedal.mp4"
playState[pedalVideo] = false
svg.appendChild(getMP4Video(pedalVideo, "0", "0", "1.0", "1.0", "30", "510", "500", "400", pedalVideo))


let threeByThreeVideo = "vid/ThreeByThreeComposition.webm"
// let threeByThreeVideo = "vid/Clip Pedal2.mp4"
// let threeByThreeVideo ="https://drive.google.com/file/d/1wIQ90owJgOfc-CIXsorR0VLy9fjPnU4M/view?usp=sharing"
// let threeByThreeVideo = "https://en.wikipedia.org/wiki/Butterfly_stroke#/media/File:Butterfly_stroke3_without_text.gif"
playState[threeByThreeVideo] = false
svg.appendChild(getMP4Video(threeByThreeVideo, "0", "0", "1.0", "1.0", "500", "1730", "1800", "1100", threeByThreeVideo))

// let pedalVideo = "vid/Clip Pedal.mp4"
// playState[pedalVideo] = false
// svg.appendChild(getMP4Video(pedalVideo, "0", "0", "1.0", "1.0", "30", "510", "500", "400", pedalVideo))

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