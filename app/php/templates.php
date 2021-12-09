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
    $returnvalue = $returnvalue . '<p>' . $paragraphs[$i]["text"] . '</p>';
  }
  if ($LenPara>$LenImag){
    for($i=$MinLen; $i<$LenPara;$i++) {
      $returnvalue = $returnvalue . '<p>' . $paragraphs[$i]["text"] . '</p>';
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


function statusOfMeetingDiv($meeting) {
  $rightness = "55px";
  // cancelled, upcoming, ongoing, completed 
  $bgcolors = array("#aa0000", "#dd04a0", "#e1ef06", "#a0aa04");
  $textcolors = array("#000", "#000","#fff","#000");
  $div = '<div style="right:' . $rightness . '; background-color:' . $bgcolors[intval($meeting["statusId"])] .
         '; color:' . $textcolors[intval($meeting["statusId"])] . '" ' .
              'class="bigg_box_" 
              style="cursor:pointer;"
              title="' . $meeting["statusDescription"] . '"><span style="cursor:default">' . 
              strtoupper($meeting["statusDescription"][0]) . '</span></div>';
  // $div = '<div style="right:' . $rightness . '; background-color:#dd04a0; color:#000"
  // class="bigg_box_"
  // style="cursor:pointer;"
  // title="Completed"><span style="cursor:default">' . strval($meeting["statusId]) . '</span></div>';
  return $div;
}

function virtualMeetingDiv($virtualFlag){
  $rightness = "0px";
  $bgcolors = array("#ccb1fa", "#440aaa");
  $textcolors = array("#000", "#fff");
  $status = array('Physical Meeting', 'Virtual Event');
  $div = '<div style="right:' . $rightness . '; background-color:' . $bgcolors[intval($virtualFlag)] .
    '; color:' . $textcolors[intval($virtualFlag)] . '" ' .
    'class="bigg_box_" 
    style="cursor:pointer;"
    title="' . $status[$virtualFlag] . '"><span style="cursor:default">' . 
    strtoupper($status[$virtualFlag][0]) . '</span></div>';
  return $div;
}


function getMinutesOfMeeting($minutes, $author) {

  $div = '';
  if (!$minutes){
    $div = '';
  } else {
    $div = '<details>
              <summary><b>Minutes</b>
              </summary>
              <div class="minutes_">' .
                str_replace("\r\n", "<br>", $minutes) .
              '</div>
              <div style="width:100%; text-align:right; color: #aa0000">Minute taker: ' . $author . '</div>
            </details>';
  }
  return $div;
}


function getMeeting($cardDOMid, $meeting, $paragraphs, $images, $participants) {
  
  $title = '';
  if ($meeting["posttypeId"]==7) {
    // There is no post (posttypeId==empty)
    $title = $meeting["description"];
    $paragraphs = array();
  } else {
    $title = $meeting["title"];
  }

  $card = '
  <div class="row mt-4">
    <div class="col-sm-12 col-md-12">
      <div class="card cardborder_ " style="margin-left: 15px; margin-right: 15px" id="' . $cardDOMid . '">
        <div class="card-header">
          <div style="width:75%">
            <h4 class="padding_ center_">' . $title . '</h4>
          </div>
          <div style="width:25%">' .
            statusOfMeetingDiv($meeting) .
            virtualMeetingDiv($meeting["virtuell"]) .          
          '</div>
        </div>
        <div class="card-body justify_">
          <div class="fade_out_text_">' .
            getTextAndImages($paragraphs, $images) .
            '<p class="read_more_"><span class="read_more_button_">Read More</span></p>
          </div> ' .
          getMinutesOfMeeting($meeting["minutes"], $meeting["minutesTaker"]) .
        '</div>
        <div class="card-footer">
        
          <div class="row">
            <div class="col-3 ">
              <p><b>Where</b><br>' . $meeting["location"] . '</p>
            </div>
            <div class="col-3">
              <p><b>When</b><br>' . strval($meeting["date"]) . '</p>
            </div>
            <div class="col-6">
              <p style="position:absolute; top:0">
                <details>
                  <summary><b>Participants from the Project</b></summary>' .
                    getParticipants($participants) .                
                  '<br>
                </details>
              </p>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>';

  return $card;
}

?>