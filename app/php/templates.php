<?php

function getTextAndImages($paragraphs, $images) {
  $LenPara = count($paragraphs);
  $LenImag = count($images);
  $MinLen = min($LenPara,$LenImag);
  $LeftRight = array("left", "right");
  $returnvalue = '';
  for($i=0; $i<$MinLen;$i++) {  
    $returnvalue = $returnvalue . '<div style="width:45%;float: ' . $LeftRight[$i % 2] . '; padding:15px">
                    <img src="' . $images[$i]["path"] . '" alt="' . $images[$i]["alt"] . '" width="100%">
                    <br>Photo by: ' . $images[$i]["author"] .
                    '</div>';
    $returnvalue = $returnvalue . $paragraphs[$i]["text"];
  }
  if ($LenPara>$LenImag){
    for($i=$MinLen; $i<$LenPara;$i++) {
      $returnvalue = $returnvalue . $paragraphs[$i]["text"]; 
    }
  } elseif ($LenPara<$LenImag){
    for($i=$MinLen; $i<$LenImag;$i++) {
      $returnvalue = $returnvalue . '<div style="width:45%;float: ' . $LeftRight[$i % 2] . '; padding:15px">
                      <img src="' . $images[$i]["path"] . '" alt="' . $images[$i]["alt"] . '" width="100%">
                      <br> Photo by: ' . $images[$i]["author"] .
                      '</div>';
    }
  } else {
    $returnvalue = $returnvalue . '';
  }

  return $returnvalue;

}


function getParticipants($participants) {
  $participantslist = '<ul>';
  for ($i=0; $i<count($participants); $i++){
      $participantslist = $participantslist . '<li>' . $participants[$i]["Name"];
      if ($participants[$i]["Affiliation"]!=''){
        $participantslist = $participantslist . ' (' . $participants[$i]["Affiliation"] . ')';
      }
      $participantslist = $participantslist . '</li>';
  }
  $participantslist = $participantslist . '</ul>';
  return $participantslist;
}

function getEvent($cardDOMid, $event, $paragraphs, $images, $participants) {
  
      $card = '<div class="row mt-4">
          <div class="col-sm-12 col-md-12">
            <div class="card cardborder_ " id="' . $cardDOMid . '">
              <div class="card-header center_"><h4 class="padding_">' . $event["title"] . '</h4></div>
              <div class="card-body justify_">' .
                  getTextAndImages($paragraphs, $images) .
              '</div>
              <div class="card-footer">
              
                <div class="row">
                  <div class="col-sm-3 col-md-3">
                    <p><b>Where</b><br>' . $event["wo"] . '</p>
                  </div>
                  <div class="col-sm-3 col-md-3">
                    <p><b>When</b><br>' . $event["from_date"] . ' until ' . $event["until_date"] . '<br>Starts at: ' . $event["beginn"] . '</p>
                  </div>
                  <div class="col-sm-3 col-md-3">
                    <p>
                      <details>
                        <summary><b>Participants from the Project</b></summary>' .
                          getParticipants($participants) .                
                        '<br>
                      </details>
                    </p>
                  </div>
                  <div class="col-sm-3 col-md-3">
                    <p><b>Contact</b><br>' . $event["email"] . '</p>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>';
    return $card;
}

?>