Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A83341C2B
	for <lists+cocci@lfdr.de>; Wed, 12 Jun 2019 08:25:55 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5C6OiUm014599;
	Wed, 12 Jun 2019 08:24:44 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id EF2FB7776;
	Wed, 12 Jun 2019 08:24:43 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 22E4D776B
 for <cocci@systeme.lip6.fr>; Wed, 12 Jun 2019 08:24:42 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5C6OfZZ002284;
 Wed, 12 Jun 2019 08:24:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1560320662;
 bh=Na84Tq5h53VwT/D6R1kesN31WJoCkGJYNZzkVe2nTyg=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=CzYODQvDOQ4y4mroeyYSwQCbzicv1j50bxigPYySrlWUtgJV8YyxznxiMAukcTuX/
 zV/4R665rbTcSxZJB4gZYqEpSx2QZrEjSViFMjR1swB8ItCRFArGbYuMrjPanZa9f4
 YckW7zcz7R3rLpKnBtBUXLUYha8SP0z3ctZ8QRo4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.21.30]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MEZPl-1hqd4h1mUz-00Fhos; Wed, 12
 Jun 2019 08:24:22 +0200
To: Enrico Weigelt <lkml@metux.net>
References: <20190406061112.31620-1-himanshujha199640@gmail.com>
 <f09006a3-691c-382a-23b8-8e9ff5b4a5f1@web.de>
 <alpine.DEB.2.21.1906081925090.2543@hadrien>
 <7b4fe770-dadd-80ba-2ba4-0f2bc90984ef@web.de>
 <f573b2d3-11d0-92b5-f8ab-4c4b6493e152@metux.net>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <f6fe6400-8fdd-cb53-f7e1-ac6188c9e785@web.de>
Date: Wed, 12 Jun 2019 08:24:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <f573b2d3-11d0-92b5-f8ab-4c4b6493e152@metux.net>
Content-Language: en-US
X-Provags-ID: V03:K1:eg+5SLbiCpk5lx6pcF6ODtIkClAzwUJ4oIktvk6OaqI5h5uMxt7
 Hxa/aNSxFhgLSQzo2FT3WSot9yJxODf1dxLqtUbRTg4Lf0UkAtI5wjea3JOGQAmxy9kZx9r
 SVhOJtsJNXhq9RQoxb1298x87lTMHGbvM5PTWP1A0NLin2QihLMyBhiuuys/dDuM6rDXNz0
 lOFrgFWJRwAOrCZ+nsS+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TzAEwWl+fKw=:VXj124DHKE+3x+A6VKMdzD
 ucPfljpbod/cgMAx6WNO15DtkBWHmec1vJYzEs/YG040vIBogLwBZ0ww0+ZW4glFLK0sQBloK
 TanEVzXUWlrClXEzS7rhHLKWKQzy0e0xiEpn/5otml7wOoiFGAexEhoVnHSoO1IGAto1Y1ZyM
 Bg6WA1zu+bC2W9+yHmXFjQqMcEr43R5WGgt5ldYGyFsloXwetDcYMVoym9WOKLzkTicaVQju0
 cAp0vvw7YS8CoPoQRE8NEzMcm75s4qoTKtyOHPZsjoQ+Mb0C492LKV5TiERSggoB0Y2U1X2s+
 ZE6qGribALQZBQoVvl3B2dUttLU7hr6p4k1kzRND+LJtBWT7UIBp/5GG08sb0XZ2kVC9wV37g
 BlPJmYE+723u/JNsv/2wQFsV5sgK/H4vC3G0BR4VJ5ns/MhrphjrKjCvkDzr67GhdmN+tcqrm
 lJze53IkrP6+NUWK6+K6VIGf2to8vglZtW84LS5Mp1Z+Gf25lrKObFp/LMoX6pqwy2WpH4UX9
 3fAUJbkESK65ptJHLeeoDaMqtzHT1XgoFyTLHNpLZhl7e0y8kWJy6cEicapDbTnlE8mtzb1fF
 M5agcfXgjgNmFbEQ5OtptqHA5bl9GwDBsqyB3UiTpumSh2bxvpwG8NmRUWUSAwEVsDALIxZBQ
 BkWQ3fjk3hsY21za8ljrhKpg3k+YGceajKEz/8WT0l/1wEOeun1wf3bc0xP2BujzEwyyibAA6
 e1I20UYSAMDK38tme8Wu7ifPoVnobcmn9Ov8Z+0hvUHFFHSxmb14hv//88AnQ5pgxz4FnbbbK
 xyjV+ojioOeM11ukDWoVKuX5XcZGFUqmHFfMM21fv20ojveQFdmrKo4eXT3NSJzMt41X1DhYI
 3Nc7DUgfP86xxDq23thMh5sLvywHdBbS/PRfP0M2K30AvmT5ZhhBDQIOBLe5TYsPMnzlJb3CT
 rULKG/bddNGcNo4ByJJDZMpkguIix+C1nh3GApC0MCUcpw2C8OMIH
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 12 Jun 2019 08:24:44 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 12 Jun 2019 08:24:41 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Nicolas Palix <nicolas.palix@imag.fr>,
        Michal Marek <michal.lkml@markovi.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        cocci@systeme.lip6.fr
Subject: Re: [Cocci] Coccinelle: api: add devm_platform_ioremap_resource
	script
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

Pj4gVGhlIGZsYWcg4oCcSU9SRVNPVVJDRV9NRU3igJ0gaXMgcGFzc2VkIGFzIHRoZSBzZWNvbmQg
cGFyYW1ldGVyIGZvciB0aGUgY2FsbAo+PiBvZiB0aGUgZnVuY3Rpb24g4oCccGxhdGZvcm1fZ2V0
X3Jlc291cmNl4oCdIGluIHRoaXMgcmVmYWN0b3JpbmcuCj4KPiBJbiB0aGF0IHBhcnRpY3VsYXIg
Y2FzZSwgd2UgbWF5YmUgc2hvdWxkIGNvbnNpZGVyIHNlcGFyYXRlIGlubGluZQo+IGhlbHBlcnMg
aW5zdGVhZCBvZiBwYXNzaW5nIHRoaXMgaXMgYSBwYXJhbWV0ZXIuCj4KPiBNYXliZSBpdCB3b3Vs
ZCBldmVuIGJlIG1vcmUgZWZmaWNpZW50IHRvIGhhdmUgY29tcGxldGVseSBzZXBhcmF0ZQo+IHZl
cnNpb25zIG9mIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpLCBzbyB3ZSBkb24ndCBl
dmVuIGhhdmUKPiB0byBwYXNzIHRoYXQgcGFyYW1ldGVyIG9uIHN0YWNrLgoKV291bGQgeW91IGxp
a2UgdG8gYWRkIGFub3RoZXIgZnVuY3Rpb24gd2hpY2ggc2hvdWxkIGJlIGNhbGxlZCBpbnN0ZWFk
IG9mCnRoZSBjb21iaW5hdGlvbiBvZiB0aGUgZnVuY3Rpb25zIOKAnHBsYXRmb3JtX2dldF9yZXNv
dXJjZeKAnSBhbmQg4oCcZGV2bV9pb3JlbWFwX3Jlc291cmNl4oCdPwoKUmVnYXJkcywKTWFya3Vz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkNvY2NpIG1h
aWxpbmcgbGlzdApDb2NjaUBzeXN0ZW1lLmxpcDYuZnIKaHR0cHM6Ly9zeXN0ZW1lLmxpcDYuZnIv
bWFpbG1hbi9saXN0aW5mby9jb2NjaQo=
