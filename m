Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9BC20ACE3
	for <lists+cocci@lfdr.de>; Fri, 26 Jun 2020 09:19:31 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05Q7IrZe008190;
	Fri, 26 Jun 2020 09:18:53 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B9FF47825;
	Fri, 26 Jun 2020 09:18:53 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 52BA23D0F
 for <cocci@systeme.lip6.fr>; Fri, 26 Jun 2020 08:37:04 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05Q6b3kf022618
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Fri, 26 Jun 2020 08:37:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1593153423;
 bh=j81jauPAk+oFm/N31iytLBvEAvazx97inDVH5vEgDt0=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=ffJ2q/6pIFYcHKR5qm6h3dn1Z3Eet+tQN7rnRr8ibdyuEVJAKEE9EjTAMIg9V3PjC
 R6k4HYgiokqigJelhBGvGvKQSWEBZUlP2Bc2x4ai68bGwUSTQ5dnA6WG0RyFRKFkso
 nF7mfWTwAgTLpfYgk/SvM7hRoFpWn89KS1KdbCHs=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.71.143]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MLPRu-1jpFwj1dpK-000dCB for
 <cocci@systeme.lip6.fr>; Fri, 26 Jun 2020 08:37:03 +0200
To: Coccinelle <cocci@systeme.lip6.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <fbcead0d-c798-63b7-2d08-e3ee1c7c38a1@web.de>
Date: Fri, 26 Jun 2020 08:36:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:MGwF9Ln9aZhpwbVVJ7L1RRyieq6tIoT2ATtuGCWcVVbogt08oNR
 ysGMBca/rM/j9Ek6G40e14BMK7zvkOj551GWAPFToLjrmoNtFgJcA4cTQD1VuWR+asXr+EQ
 bowbJJ5kjl49mPnmFujz73xhcCto3vMyKtLuDU/15eQbz43PWxBw4HBqNzBmFjneOKNcwg8
 AwUurEzuO7Oc0ePAHL8Sw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:d2Cf9PLvaCc=:+n1IFsW1V9/tLOqJZzH3Qh
 /sv6CGasHRKwIt6Zo13bjyvQseyDpELTaS9O5VK8dGcOOIUzaL3TDNyTvo0c8GFkGOHi1BK3m
 /skKE/BBKqtIe4IkbAg9UA36zHcrh7kcYykgfyciLss54Uxeo9JsZQcX/UaQeLEbvPfSuc8QD
 8xVulFMSz4x6BQla+DFyqCrSZqXDwWxZ99nEe/7zT5V1e0JiE4gJRlKmfUCclcHLye8368LdR
 yk2NtL2D0JRLeNlpElkKdGy5o9li/betZDH3F8lUw7S2LUp0lGGPM6lLNkWY5TJo0UthPrmjN
 VsFWfQuMMZZG4EPJNz8RxnNg07l11HS/F5zQr5ppG8GoXNjXZljJo0nbgbwo0m/LhJZS2M6ge
 9K7X+QjNWuk6h8zTQOFXRLVFPS9oXkGZME+iNEoigGdUXeqATT7BI7qHBAqifBwvebdMqgcvA
 Ur3n1dTE/aQQs8x05bLX/bUlFAGi3FL/c5kXKAA5RbLCmP6kaUZ0tmObQMra2bPfqZ5UQSvhq
 58IazfKovfoRP60GdZCTex710CwerF4anyH3Ev6Z3+Gw2wH5X/s3AFsQI114xckY+Qcv2y0jd
 Z2dEyU63/DyUmXclaoLg4F3zq0LmOO0G+oJ18Pg/de0whOpIzyLXwtBlxpKidG6tCM9Ty/o+X
 ISTILvJb//iN3+e91vuS2P7SQvSl8ftDEuAhufHJC03TEw0HjK+YdRzEiwz6rj9X9ja5/vbb0
 Z41C6kn0Qt/zuwV7cqlynZoptfUYty4YrOcF2IeBoiFfJb8SK8mhXbZJVZ5flqv1v5kAaxV8E
 sOcdh4sxQmu5jEjJwcRhuTnBEnElDudWIyZ57zjInVpTFPMDco8Kq69NEsm1piEhoUVCM66D5
 88PJEmeO7lZ8o8a0Hgf5BkhtdxCrIQUrzTT4mQH9MWkD5ggxfp5AJLmlSDnc09HH1od6/sLmm
 WbxPN3JiWGLY3cpgetc+SX11yPzCfhI6MQg2h2Y7H3qQ4dtXppjHAY0EaZ2Y+7LBoULb9MTKA
 P2oYGbzDyVDEXqurTRzHlGPENL+LvP6rt8WYm+nyM5LL8p1uaQNiM/0jlkKzHG5CB5IncRCvU
 T7zivVzAwb1a9lrBtZKwtILR4WF7haW5aU81rHL3pu7AGimq+IyJetLlyeVpgO56q9TQGljYO
 OAeEUYuC/kKWOPPylM5xOlW4E3W0kMibDgV9hPsk6SsZyQt4s/TJyNbfdVK8QplBiR8Kw0CH0
 v74gLGAZK9n/OSBgX
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 26 Jun 2020 09:18:56 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 26 Jun 2020 08:37:03 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Fri, 26 Jun 2020 09:18:51 +0200
Subject: [Cocci] Checking the display of SmPL isomorphism results (with
	pointers)
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

SGVsbG8sCgpJIGhhdmUgdHJpZWQgYW5vdGhlciB0aW55IHNjcmlwdCB2YXJpYW50IG91dCBmb3Ig
dGhlIHNlbWFudGljIHBhdGNoIGxhbmd1YWdlCihhY2NvcmRpbmcgdG8gdGhlIHNvZnR3YXJlIGNv
bWJpbmF0aW9uIOKAnENvY2NpbmVsbGUgMS4wLjgtMDAxMzEtZzY3NWI5Njcw4oCdKS4KCkBkaXNw
bGF5QApleHByZXNzaW9uKiB4OwpzdGF0ZW1lbnQgaXMsIGVzOwpAQAoqaWYgKCF4KQogICAgaXMK
IGVsc2UKICAgIGVzCgoKZWxmcmluZ0BTb25uZTp+L1Byb2pla3RlL0NvY2NpbmVsbGUvamFuaXRv
cj4gc3BhdGNoIC0tcGFyc2UtY29jY2kgc2hvd19udWxsX3BvaW50ZXJfY2hlY2tzLmNvY2NpCuKA
pgppZiAoKiEqeCAqIT0gKk5VTEwpCuKApgppZiAoKiEqTlVMTCAqIT0gKngpCuKApgppZiAoKngg
KiE9ICpOVUxMICo9PSAqTlVMTCkK4oCmCmlmICgqTlVMTCAqIT0gKnggKj09ICpOVUxMKQrigKYK
aWYgKCpOVUxMICo9PSAqeCAqIT0gKk5VTEwpCuKApgppZiAoKk5VTEwgKj09ICpOVUxMICohPSAq
eCkK4oCmCgoKTm93IEkgZmluZCB0aGUgc2hvd24gbGluZXMgaW4gc3VjaCBhIHByb2dyYW0gb3V0
cHV0IHF1ZXN0aW9uYWJsZS4KU2hvdWxkIHRoZXNlIHByZXNlbnRhdGlvbnMgb2YgZWxlbWVudHMg
aW4gU21QTCBkaXNqdW5jdGlvbnMgYmUgc2hvcnRlcj8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpDb2NjaSBtYWlsaW5nIGxp
c3QKQ29jY2lAc3lzdGVtZS5saXA2LmZyCmh0dHBzOi8vc3lzdGVtZS5saXA2LmZyL21haWxtYW4v
bGlzdGluZm8vY29jY2kK
