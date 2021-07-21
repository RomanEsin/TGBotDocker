import Foundation
import TelegramBotSDK

let bot = TelegramBot(token: "1916636333:AAHDzlsi8MGp8CVjUYSn16fUA3YizTw1RKg")
let router = Router(bot: bot)

router["start"] = { context in
    guard let from = context.message?.from else { return false }
    context.respondAsync("Пошул нахуй, \(from.firstName)!")
    return true
}

while let update = bot.nextUpdateSync() {
    try router.process(update: update)
}

fatalError("Server stopped due to error: \(bot.lastError)")
