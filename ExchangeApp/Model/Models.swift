//
//  Gold.swift
//  ExchangeApp
//
//  Created by Erencan Evren on 17.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import Foundation

class Gold: baseModel {
}

class Stock: baseModel {
}

class Exchange: baseModel {
    
}

class Cryptocoin: baseModel {
    
}

class baseModel: Codable {
    var selling: Float?
    var update_date: UInt32?
    var gold: Int?
    var buying: Float?
    var source: Int?
    var change_rate: Float?
    var name: String?
    var full_name: String?
    var short_name: String?
    var source_name: String?
    var source_full_name: String?
    var code: String?
    var ticker: String?
    var latest: Float?
    var first_seance_lowest: Float?
    var second_seance_lowest: Float?
    var first_seance_highest: Float?
    var second_seance_highest: Float?
    var first_seance_closing: Float?
    var second_seance_closing: Float?
    var previous_closing: Float?
    var totalSupply: Int?
    var selling_try: String?
    var fullName: String?
    var updateDate: Int?
    var volumeStr: String?
    var volume: Int?
    var changeRate: Float?
    var videoId: String?
    var marketCap: Int?
    var availableSupply: Int?
    var maxSupply: Int?
    var koinim: Int?
    var rank: Int?
    var symbol: String?
}

/*
 "code": "litecoin",
 "koinim": 2,
 "name": "Litecoin",
 "full_name": "Litecoin",
 "symbol": "LTC",
 "buying": 91.3731,
 "selling": 91.3731,
 "change_rate": 9.32,
 "volume": 387419000,
 "rank": 7,
 "market_cap": 5250207597,
 "available_supply": 57459007,
 "max_supply": 84000000,
 "total_supply": 57459007,
 "update_date": 1531914541,
 "content": "<h1><strong>Litecoin (LTC) Nedir?<\/strong><\/h1>\r\n\r\n<p>Litecoin (<strong>LTC<\/strong>) MIT \/ X11 lisans\u0131 alt\u0131nda piyasaya s&uuml;r&uuml;len e\u015fler aras\u0131 \u015fifreli e\u015f zamanlama ve a&ccedil;\u0131k kaynak yaz\u0131l\u0131m projesidir. Koinlerin yarat\u0131lmas\u0131 ve nakli, a&ccedil;\u0131k kaynak \u015fifreleme protokol&uuml;ne dayan\u0131r ve herhangi bir merkezi otorite taraf\u0131ndan y&ouml;netilmez.<\/p>\r\n\r\n<p>Litecoin, <a href=\"https:\/\/www.doviz.com\/kripto-paralar\/bitcoin\">Bitcoin<\/a> (BTC) ile teknik a&ccedil;\u0131dan neredeyse ayn\u0131 olsa da, Bitcoin&#39;den ve di\u011fer kripto koinlerden &ldquo;<strong>Ayr\u0131k Tan\u0131klar\u0131n Kabul Edilmesi<\/strong>&rdquo; ve &ldquo;<strong>Y\u0131ld\u0131r\u0131m A\u011f\u0131<\/strong>&rdquo; gibi teknik &ouml;zelliklerle ayr\u0131l\u0131r. Bunlar, Bitcoin&rsquo;de de kar\u015f\u0131la\u015f\u0131lan potansiyel darbo\u011fazlar\u0131 azaltarak belirli bir s&uuml;rede a\u011f taraf\u0131ndan daha fazla i\u015flemin i\u015flenmesine etkin bir \u015fekilde izin verir.<\/p>\r\n\r\n<p>Litecoin&#39;in &ouml;deme maliyeti hemen hemen s\u0131f\u0131rd\u0131r ve Bitcoin&#39;den yakla\u015f\u0131k d&ouml;rt kat daha h\u0131zl\u0131 &ouml;deme yap\u0131l\u0131r.<\/p>\r\n\r\n<h2><strong>Litecoin Tarihi<\/strong><\/h2>\r\n\r\n<p>Litecoin, eski Google &ccedil;al\u0131\u015fan\u0131 Charlie Lee taraf\u0131ndan 7 Ekim 2011&#39;de GitHub&#39;da bir a&ccedil;\u0131k kaynak istemcisi arac\u0131l\u0131\u011f\u0131yla serbest b\u0131rak\u0131ld\u0131. Bitcoin Core istemcisinin bir dal\u0131 olarak; &ouml;ncelikle blok &uuml;retme s&uuml;resi azalt\u0131ld\u0131 sonras\u0131nda ise azami sikke say\u0131s\u0131na, farkl\u0131 karma algoritmas\u0131 (scrypt, SHA-256 yerine) ve biraz modifiye edilmi\u015f bir <strong>GUI<\/strong>&#39;ye sahip oldu.<\/p>\r\n\r\n<p>Kas\u0131m 2013 ay\u0131nda, Litecoin&#39;in toplam de\u011feri, 24 saat i&ccedil;inde% 100 s\u0131&ccedil;rama i&ccedil;eren b&uuml;y&uuml;k bir b&uuml;y&uuml;me ya\u015fad\u0131.<\/p>\r\n\r\n<p>Litecoin&rsquo;in de\u011feri Kas\u0131m 2013&#39;te 1 milyar dolara ula\u015ft\u0131. 9 May\u0131s 2017 tarihinden itibaren, piyasa de\u011feri, kripto para ba\u015f\u0131na yakla\u015f\u0131k 30 ABD Dolar\u0131 olarak toplam 1,542,657,077 Amerikan dolar\u0131 seviyesindeydi.<\/p>\r\n\r\n<p>May\u0131s 2017&#39;de Litecoin, piyasa de\u011feri en y&uuml;ksek 5 para biriminden Ay\u0131r\u0131lm\u0131\u015f Tan\u0131k&rsquo;\u0131 benimseyen ilk kripto koin oldu. Ayn\u0131 y\u0131l\u0131n May\u0131s ay\u0131nda, ilk Lightning Network i\u015flemi, bir saniyenin alt\u0131nda Z&uuml;rih&#39;ten San Francisco&#39;ya 0.00000001 LTC aktararak tamamland\u0131.<\/p>\r\n\r\n<h2><strong>Litecoin Geli\u015ftirmeleri<\/strong><\/h2>\r\n\r\n<p>Litecoin s&uuml;r&uuml;m&uuml; <strong>0.8.5.1<\/strong>, Kas\u0131m 2013&#39;te piyasaya &ccedil;\u0131kt\u0131. Bu s&uuml;r&uuml;m ile g&uuml;venlik a&ccedil;\u0131\u011f\u0131 d&uuml;zeltmeleri ve Litecoin a\u011f\u0131na geli\u015fmi\u015f g&uuml;venlik &ouml;nlemleri eklendi.<\/p>\r\n\r\n<p>Litecoin geli\u015ftirici ekibi, Aral\u0131k 2013&#39;&uuml;n ba\u015f\u0131nda <strong>0.8.6.1<\/strong> s&uuml;r&uuml;m&uuml;n&uuml; yay\u0131mlad\u0131. Yeni s&uuml;r&uuml;m, i\u015flem &uuml;cretlerinde 20 kat azalma ve m&uuml;\u015fteride ve a\u011fda di\u011fer g&uuml;venlik ve performans iyile\u015ftirmeleri sa\u011flad\u0131. Kaynak kodu ve ikili dosyalar, &quot;#litecoin&quot; IRC kanal\u0131ndaki insanlara, resmi Litecoin forumlar\u0131na ve Reddit&#39;e, g&uuml;&ccedil; kullan\u0131c\u0131lar\u0131 i&ccedil;in yap\u0131land\u0131rma dosyas\u0131na bir Litecoin s&uuml;per d&uuml;\u011fmesi eklenece\u011fi haberi verildi, ana site ise yeterli say\u0131da a\u011f\u0131n yeni s&uuml;r&uuml;m&uuml; &ccedil;al\u0131\u015ft\u0131r\u0131ld\u0131ktan sonra g&uuml;ncellendi. Bu s&uuml;r&uuml;m y&ouml;ntemi ayn\u0131 zamanda s&uuml;r&uuml;m 0.8.6.1 istemcilerinden yap\u0131lan d&uuml;\u015f&uuml;k &uuml;cretli i\u015flemlerin daha eski s&uuml;r&uuml;mleri &ccedil;al\u0131\u015ft\u0131ran istemciler taraf\u0131ndan ertelenmemesini sa\u011flamak i&ccedil;in de kullan\u0131ld\u0131.<\/p>\r\n\r\n<p>Nisan 2014&#39;te, Litecoin&#39;in yeni bir s&uuml;r&uuml;m&uuml; <strong>0.8.7.1<\/strong> s&uuml;r&uuml;m&uuml; piyasaya s&uuml;r&uuml;ld&uuml;. Bu s&uuml;r&uuml;m, baz\u0131 k&uuml;&ccedil;&uuml;k sorunlar\u0131n yan\u0131 s\u0131ra, Heartbleed g&uuml;venlik hatas\u0131yla ilgili &ouml;nemli bir d&uuml;zeltme de d&uuml;zeltti.<\/p>\r\n\r\n<h2><strong>Litecoin&rsquo;in Bitcoin&rsquo;den Farklar\u0131<\/strong><\/h2>\r\n\r\n<p>Litecoin, Bitcoin&#39;den &uuml;&ccedil; &ouml;nemli fark sunuyor.<\/p>\r\n\r\n<p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Litecoin A\u011f\u0131, geli\u015ftiricilerinin daha h\u0131zl\u0131 i\u015flem onaylamas\u0131na izin verdi\u011fi Bitcoin&#39;in 10 dakikas\u0131ndan ziyade her 2,5 dakikada bir, bir blok i\u015flemek i&ccedil;in &ccedil;al\u0131\u015f\u0131yor. Litecoin ayn\u0131 zamanda Bitcoin&rsquo;e g&ouml;re &ccedil;ifte sald\u0131r\u0131 kar\u015f\u0131s\u0131nda da daha g&uuml;&ccedil;l&uuml;.<\/p>\r\n\r\n<p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Litecoin, istihdam kan\u0131tlama algoritmas\u0131nda, bellek bak\u0131m\u0131ndan zor olmayan bir algoritmadan asimptotik olarak daha fazla bellek gerektiren ard\u0131\u015f\u0131k bir bellek-sabit i\u015flevi olan scrypt kullan\u0131r.<\/p>\r\n\r\n<p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Litecoin A\u011f\u0131, Bitcoin A\u011f\u0131&rsquo;na g&ouml;re 4 kat daha fazla kripto koin &uuml;retecek, bu da 84 milyona denk geliyor.<\/p>\r\n\r\n<h2><strong>Litecoin (LTC) Ne Kadar?<\/strong><\/h2>\r\n\r\n<p>Uzun bir s&uuml;re 3 Amerikan Dolar\u0131 seviyelerinde seyreden Litecoin 20 Mart 2017 tarihi ile h\u0131zla y&uuml;kselerek 3 Temmuz 2017 tarihinde 49 dolar seviyelerine kadar y&uuml;kseldi.&nbsp;<\/p>\r\n",
 "video_id": "10154669",
 "selling_try": "441,63",
 "volume_str": "387.419.000" */
