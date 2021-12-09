<?php

    $allEventsSQL = "SELECT  
        ev.eventId, ev.name, ev.host, ev.email, ev.from_date, ev.until_date, ev.wo, ev.beginn, ev.virtuell, ps.postId, ps.title, ps.subtitle , eS.description as EventStatus, eT.description as EventType
        FROM events ev 
        LEFT JOIN posts ps ON ev.postId=ps.postId
        LEFT JOIN gatherings gth ON ev.gatheringId=gth.gatheringId
        LEFT JOIN eventType eT ON gth.eventTypeId=eT.eventTypeId
        LEFT JOIN eventStatus eS ON ev.statusId=eS.statusId
        ORDER BY ev.from_date DESC;";


    $allMeetingsSQL = "SELECT mt.meetingId, mt.date, mt.location, mt.virtuell, mt.description, eS.description AS statusDescription, eS.statusId, ps.postId, ps.posttypeId, ps.title, ps.subtitle, eT.eventTypeId, eT.description AS eventTypeDescription, mnts.minutes, tn.Name AS minutesTaker
        FROM meetings mt 
        LEFT JOIN eventStatus eS ON mt.statusTypeId=eS.statusId
        LEFT JOIN gatherings gth ON mt.gatheringId=gth.gatheringId
        LEFT JOIN eventType eT ON gth.eventTypeId=eT.eventTypeId
        LEFT JOIN posts ps ON ps.postId=mt.postId
        LEFT JOIN `minutes` mnts ON mnts.gatheringId=gth.gatheringId
        LEFT JOIN teilnehmer tn ON mnts.nameId=tn.id
        ORDER BY mt.date DESC;";


    function getParticipantsOfEventSQL ($eventid) {
        return "SELECT tn.Name, tn.Affiliation
            FROM events ev
            INNER JOIN gatherings gth ON gth.gatheringId=ev.gatheringId
            INNER JOIN participation pc on gth.gatheringId=pc.gatheringId
            INNER JOIN teilnehmer tn on pc.nameId=tn.id
            WHERE ev.eventId=" . $eventid . ";";
    }

    function getParticipantsOfMeetingSQL ($meetingid) {
        return "SELECT tn.Name, tn.Affiliation
            FROM meetings mt
            INNER JOIN gatherings gth ON gth.gatheringId=mt.gatheringId
            INNER JOIN participation pc on gth.gatheringId=pc.gatheringId
            INNER JOIN teilnehmer tn on pc.nameId=tn.id
            WHERE mt.meetingId=" . $meetingid . ";";
    }

    function getParagraphsOfEventSQL ($eventid) {
        return "SELECT 
            prgph.postId, prgph.text, prgph.ordinal
            FROM events ev
            INNER JOIN paragraphs prgph ON ev.postId=prgph.postId
            WHERE ev.eventId=" . $eventid . " 
            ORDER BY prgph.ordinal ASC;";
    }

    function getParagraphsOfMeetingSQL ($meetingid) {
        return "SELECT 
            prgph.postId, prgph.text, prgph.ordinal
            FROM meetings mt
            INNER JOIN paragraphs prgph ON mt.postId=prgph.postId
            WHERE mt.meetingId=" . $meetingid .  
            " ORDER BY prgph.ordinal ASC;";
    }

    function getImagesOfPostSQL ($postid) {
        $mediatypeId = 1;
        return "SELECT md.path, md.author, md.alt
            FROM posts ps
            INNER JOIN mediaInPosts mIP ON ps.postId=mIP.postId
            INNER JOIN media md ON md.mediaId=mIP.mediaId
            WHERE ps.postId=" . $postid . " AND md.mediatypeId=" . $mediatypeId . ";";
    }

?>