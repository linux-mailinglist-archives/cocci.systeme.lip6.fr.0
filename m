Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C16A1FCACB
	for <lists+cocci@lfdr.de>; Thu, 14 Nov 2019 17:35:14 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAEGYsL7024442;
	Thu, 14 Nov 2019 17:34:54 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 43ABF77DD;
	Thu, 14 Nov 2019 17:34:54 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 43B6177D4
 for <cocci@systeme.lip6.fr>; Thu, 14 Nov 2019 17:34:52 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAEGYnca013029;
 Thu, 14 Nov 2019 17:34:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1573749289;
 bh=A5LWtOnPmRvGDvkpaGM3HQgAGEnwrPlUubFLR/6UHvE=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=lP8L6HKTQR1A3M9Ngy6sCb3W9sw9Bsg1VydsKJXpaCdUalBQZptRoZ/6kW2A0GOQI
 xI3FPh/5w5gbEbqbAjxvxpUUUjkbHPADw2Z+cMwuQ0ZA9rh52klemGRPn66+gpisKf
 UG2izW4LiClLwBlB0EK/rUEJLZ06DWH969hwC5bg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.131.120.12]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MLg8p-1iVZ3y0wXT-000t4g; Thu, 14
 Nov 2019 17:34:49 +0100
To: Julia Lawall <julia.lawall@lip6.fr>
References: <12ee1bd3-9849-ce84-f03b-104b1c1cc86e@web.de>
 <alpine.DEB.2.21.1911120524180.2536@hadrien>
 <162df2a3-b989-c244-0fa7-f26596df7722@web.de>
 <alpine.DEB.2.21.1911140735150.2239@hadrien>
 <42fd0ee0-d4b7-5f30-2896-57bd10900be7@web.de>
 <alpine.DEB.2.21.1911140813570.2239@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <35fe34b5-9b1b-e9f0-456d-77fa936c1fc3@web.de>
Date: Thu, 14 Nov 2019 17:34:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911140813570.2239@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:1WcqFvcaAM9udZHwm3r5r7AY2adbj6hpN0lCYXQqh6cDlQu9I8N
 K+gzBku7Sd4pNwpY//x8i5XyOx2NKW/2SsQgLY0URU6FeqzKMXM9Ylay62fw19vQl8NObq/
 MvONXwLeCWwOmyRZfd4kiRbqd7DcX71HoiZcadT5bC3mYTyeo0Q7WQK7TecaJPTDozOIbO6
 BWK0x0z7wEca1YCHeMEUw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SO3SeIGJ3FY=:WJ11t0nvPouDHRQgxUxzkv
 AJ2s4K4P/97v2xr4edaHsphDgUY6p/xW5+a5f1XEkw5lBJopcfQ4E8QoTTTHxs6nqEeKC7cy4
 qvT76rchLR+MExRu+nP2vk/9TA0x7Uo+h7UJOOlrx/qIdsHnUXj2IZPZLE1w8zz9sFI8sBo/a
 r8XT+IHJ+EfIO61VoqODJrZIUGKZhGnKmq85IkiuMI/TbdTUsBYh8VgCZn3PE4hptfipTG9uk
 6ZNpNLSreUW0BguzSTYCQgSkfpKgQy9wnwuMfzuoDpckX5lUj/JjQifa0pomEurcsdTnoU3uK
 JuUIu4Ogykj5eQXU4AAcddr7X0uNUFfdlbxk8ioax2iDFKBb6KupK3WrK8JQODZ9sPy6Izz77
 Ku3PpZDXzWTD5d6aQv2+P+2rBAOSBatVGUIc+9dGyytjhsHjcn5qs00yK/EEGOfpOWVyEqvYF
 UfSxDu7MB1ExlAPPcXGeGE1aXcqaNDBFzY4wk9VGJTt2f2wWCRbT/+6i+JPYz/OctuLMv2DO5
 xjQlYnvVzkJwwtV5dO/aa+gd/HHKIDzUkGxuyRXCgkdXTfdrR6/MtFDaupGU1YQQhft/HvgMY
 APERluEgfE15Vgnu8Lz4TyXAViOydpQP3/DAbQfPIVt792X6hWI0z9OG4hbbKG4+MMRjBtXCf
 yyjVgoXUg72cSHyVDreoEXin9qtr1VcM34xlU0LsBYjrjfWfLHktAah0BXT56XC8jmDx9TITl
 +d7KEk+8qi9h+owx7QbFHRXPpWg3l6kjAAov045VpBL9msNaF20SbEW+b6NpYzWsRF/tavPJv
 nsofJZglcCkRgiH7gjjFni6KLM/RON7u5jxwst7qNHXOjbBW7m9nIg4RHTi8wikDKYjGIf1ZL
 4MA8W2rUfWJpSyYivEYwoYDF65QGeLGDjh1Za0AJxWp4ylL56jbQN/Lp2ODNISaAVBZgoP0WY
 QHpkmp95C4DaLomDvXFnkcHthow5fRYTGx8cMaQUsTuZcw1QxehdzfOssXrKPa4iy94BEIlJ+
 qGbxMAPjTORIRQ5dOlz4DRwr9IrHWTDv4D4lcRiRM0poeDScfo/iiCvAltv6Fmh8N5XhFS4WJ
 D8TsrnZoQvUWLz8P1c7+6UCVVexpClbrus+jV66H1yyFxT4+tWAlQkfBjJQPrnxr2t7YOVEP5
 iajlwEJn4M8CF/o6/Okx3cRdh0+quPbndEtf6KrTLKTpj6aZtH0Xr26ls3AI54D+0clWEOrxW
 akpMJbnhtkOmzkLC/q5WVSezzQ/OKCEXmBNIVbbgo4t2Co5tpogENmC0tUJA=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 14 Nov 2019 17:34:54 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 14 Nov 2019 17:34:51 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Using the same replacement for different source code
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

> OK, so we have an example that works.

Probably not only for a simple parsing test.


> What doesn't work that you are asking about?

We got different development views around applications of SmPL disjunctions
for source code replacements.

* Which open issues will still be reconsidered here?

* Will it become more interesting then to move special stuff into SmPL constraints?

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
