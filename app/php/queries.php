<?php

    $allEventsSQL = "SELECT  
        ev.eventId, ev.name, ev.host, ev.email, ev.from_date, ev.until_date, ev.wo, ev.beginn, ev.virtuell, ps.title, ps.subtitle , eS.description as EventStatus, eT.description as EventType
        FROM events ev 
        LEFT JOIN posts ps ON ev.postId=ps.postId
        LEFT JOIN gatherings gth ON ev.gatheringId=gth.gatheringId
        LEFT JOIN eventType eT ON gth.eventTypeId=eT.eventTypeId
        LEFT JOIN eventStatus eS ON ev.statusId=eS.statusId
        ORDER BY ev.from_date ASC;";

    function getParticipantsOfEventSQL ($eventid) {
        return "SELECT tn.Name, tn.Affiliation
            FROM events ev
            INNER JOIN gatherings gth ON gth.gatheringId=ev.gatheringId
            INNER JOIN participation pc on gth.gatheringId=pc.gatheringId
            INNER JOIN teilnehmer tn on pc.nameId=tn.id
            WHERE ev.eventId=" . $eventid . ";";
    }

    function getParagraphsOfEventSQL ($eventid) {
        return "SELECT 
            prgph.postId, prgph.text, prgph.ordinal
            FROM events ev
            INNER JOIN paragraphs prgph ON ev.postId=prgph.postId
            WHERE ev.eventId=" . $eventid . " 
            ORDER BY prgph.ordinal ASC;";
    }

    function getImagesOfEventSQL ($eventid) {
        $mediatypeId = 1;
        return "SELECT md.path, md.author, md.alt
            FROM posts ps
            INNER JOIN mediaInPosts mIP ON ps.postId=mIP.postId
            INNER JOIN media md ON md.mediaId=mIP.mediaId
            WHERE ps.postId=" . $eventid . " AND md.mediatypeId=" . $mediatypeId . ";";
    }

?>