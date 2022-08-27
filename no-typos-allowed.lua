require "paper"

no_typos_allowed = {
    r = 0,
    savetime = 0,
    typotime = 0,
}

strings =  {
    ["clear"] = function () love.load() end,
    ["upupdowndownleftrightleftrightba"] = function () love.system.openURL("https://en.wikipedia.org/wiki/Konami_Code") end,
    ["navy"] = function () no_typos_allowed.navy = not no_typos_allowed.navy end,
    ["quit"] = function () love.event.quit() end,
    ["save"] = function () no_typos_allowed.save() end,
}

no_typos_allowed.currentstring = ""
no_typos_allowed.navy = false
no_typos_allowed.str = "What the fuck did you just fucking say about me, you little bitch?\
 I'll have you know I graduated top of my class in the Navy Seals, and I've been\
 involved in numerous secret raids on Al-Quaeda, and I have over 300 confirmed\
 kills. I am trained in gorilla warfare and I'm the top sniper in the entire US\
 armed forces. You are nothing to me but just another target. I will wipe you the\
 fuck out with precision the likes of which has never been seen before on this Earth,\
 mark my fucking words. You think you can get away with saying that shit to me over the\
 Internet? Think again, fucker. As we speak I am contacting my secret network of spies\
 across the USA and your IP is being traced right now so you better prepare for the\
 storm, maggot. The storm that wipes out the pathetic little thing you call your life.\
 You're fucking dead, kid. I can be anywhere, anytime, and I can kill you in over seven\
 hundred ways, and that's just with my bare hands. Not only am I extensively trained in\
 unarmed combat, but I have access to the entire arsenal of the United States Marine Corps\
 and I will use it to its full extent to wipe your miserable ass off the face of the\
 continent, you little shit. If only you could have known what unholy retribution your\
 little \"clever\" comment was about to bring down upon you, maybe you would have held\
 your fucking tongue. But you couldn't, you didn't, and now you're paying the price,\
 you goddamn idiot. I will shit fury all over you and you will drown in it.\
 \
 You're fucking dead, kiddo."

function no_typos_allowed.load()
    no_typos_allowed.currentstring = ""
    no_typos_allowed.navy = false
end

function no_typos_allowed.newchar(key)
    if key == "return" then
        for i, v in pairs(strings) do
            if i == no_typos_allowed.currentstring then
                v()
            end
        end
        no_typos_allowed.currentstring = ""
    else
        if key == "backspace" or key == "delete" then
            no_typos_allowed.typotime = 1
        end
        no_typos_allowed.currentstring = no_typos_allowed.currentstring..key
    end
end

function no_typos_allowed.draw()
    if no_typos_allowed.navy then
        love.graphics.print({{1, 0, 0, 1}, no_typos_allowed.str}, 500, 200, no_typos_allowed.r, nil, nil, 200, 100)
    end

    if no_typos_allowed.savetime > 0 then
        love.graphics.print({{1, 0, 0, 1}, "no"}, 600, 200, nil, 16, 16)
    end

    if no_typos_allowed.typotime > 0 then
        love.graphics.print({{1, 0, 0, 1}, "Trying to correct a typo are we?"}, 300, 200, nil, 4, 4)
    end

end

function no_typos_allowed.update(dt)
    if no_typos_allowed.navy then
        no_typos_allowed.r = no_typos_allowed.r + 0.3 * dt
    end

    if no_typos_allowed.savetime > 0 then
        no_typos_allowed.savetime = no_typos_allowed.savetime - dt
    else
        no_typos_allowed.savetime = 0
    end


    if no_typos_allowed.typotime > 0 then
        no_typos_allowed.typotime = no_typos_allowed.typotime - dt
    else
        no_typos_allowed.typotime = 0
    end
end

function no_typos_allowed.save()
    no_typos_allowed.savetime = 1
end
