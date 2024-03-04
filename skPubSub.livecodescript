script "skPubSub"
local sEventsA

on libraryStack
    insert the script of me into back
end libraryStack

on subscribe pEvent, pCallback, pTarget
    if pTarget is empty then put the long id of the target into pTarget
    put empty into sEventsA[pEvent][pTarget][pCallback]
end subscribe

command broadcast pEvent, pData
    repeat for each key tTarget in sEventsA[pEvent]
        repeat for each key tCallback in sEventsA[pEvent][tTarget]
            dispatch tCallback to tTarget with pData
        end repeat
    end repeat
end broadcast

command unsubscribe pEvent, pCallback, pTarget
    if pCallback is empty then
        delete variable sEventsA[pEvent][pTarget]
    else
        repeat for each key tCallback in sEventsA[pEvent][pTarget]
            if tCallback is pCallback then delete variable  sEventsA[pEvent][pTarget][tCallback]
        end repeat
    end if
end unsubscribe

command removeAllSubscriptions
    put empty into sEventsA
end removeAllSubscriptions
