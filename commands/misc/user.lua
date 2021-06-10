return {
    name = "user",
    description = "reutrn information about a user",
    hidden = false,
    command = function (message)
        local member
        if message.mentionedUsers.first then
            member = message.guild:getMember(message.mentionedUsers.first.id)
        elseif message.guild:getMember(args) then
            member = message.guild:getMember(args)
        elseif not args then
            member = message.guild:getMember(message.author.id)
        end

        if not member then
            message:reply(err)
        else
            message:addReaction("✨")
            local roleString, roleCount = ""
            if not member.roles.first then
                roleString = "none"
                roleCount = "0"
            else
                for role in member.roles:iter() do
                    roleString = roleString..role.mentionString.." "
                end
                roleCount = member.roles:count()
            end
            local perms
            if member:hasPermission("administrator") then
                perms = "administrator"
            else
                perms = utils.tableToString(member:getPermissions():toArray())
            end
            local embedColor
            if member:getColor().value == 0 then
                embedColor = botColor
            else
                embedColor = member:getColor().value
            end
            message:reply(member.roles.first)
            message:reply({ embed = {author = {name = member.tag, icon_url = member:getAvatarURL(1024)}, thumbnail = {url = member:getAvatarURL(1024)}, color = embedColor, description = member.user.mentionString, fields = {{name = "joined", value = os.date("%d %b, %Y %I:%M:%S %p", discordia.Date.parseISO(member.joinedAt) + 2 * 60 * 60), inline = true}, {name = "registered", value = os.date("%d %b, %Y %I:%M:%S %p", member.user.createdAt + 2 * 60 * 60), inline = true}, {name = "bot", value = tostring(member.user.bot):lower()}, {name = "roles ["..roleCount.."]", value = roleString}, {name = "perms", value = perms}}, footer = {text = "ID: "..member.id}}})
        end
    end
}