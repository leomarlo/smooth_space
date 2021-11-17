<?php

function getCard($name, $type, $status) {
    return '<div style="padding:20px;background-color:#ddd;position:absolute;left:0">
          Name: ' . $name . 
          '<br>EventType: ' . $type . 
          '<br>EventStatus: ' . $status .  
          '</divl><br>'; 
  }

function getTextAndImages($paragraphs, $images) {
  $LenPara = count($paragraphs);
  $LenImag = count($images);
  $MinLen = min($LenPara,$LenImag);
  $LeftRight = array("left", "right");
  $returnvalue = '';
  for($i=0; $i<$MinLen;$i++) {  
    $returnvalue += '<div style="width:45%;float: ' . $LeftRight[$i % 2] . '; padding:15px">
                    <img src="' . $images[$i]["path"] . '" alt="' . $images[$i]["alt"] . '" width="100%">
                    <br> ' . $images[$i]["author"] .
                    '</div>';
    $returnvalue +=  $paragraphs[$i]["text"];
  }
  if ($LenPara>$LenImag){
    for($i=$MinLen; $i<$LenPara;$i++) {
      $returnvalue +=  $paragraphs[$i]["text"]; 
    }
  } elseif ($LenPara<$LenImag){
    for($i=$MinLen; $i<$LenImag;$i++) {
      $returnvalue += '<div style="width:45%;float: ' . $LeftRight[$i % 2] . '; padding:15px">
                      <img src="' . $images[$i]["path"] . '" alt="' . $images[$i]["alt"] . '" width="100%">
                      <br> ' . $images[$i]["author"] .
                      '</div>';
    }
  } else {
    $returnvalue += ''
  }

  return $returnvalue

}

function getEvent($cardDOMid, $event, $paragraphs, $images, $participants) {
      '<div class="row mt-4">
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
                <p><b>When</b><br>' . $event["from_date"] . '<br>' . $event["until_date"] . '</p>
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
                <p><b>Contact</b><br>leonhard.horstmeyer@gmail.com</p>
                </div>
              </div>




              
              </div>
            </div>
          </div>
        </div>'

}

?>