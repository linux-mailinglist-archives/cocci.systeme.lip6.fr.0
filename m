Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3842F9C460
	for <lists+cocci@lfdr.de>; Sun, 25 Aug 2019 16:20:01 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x7PEJeXh016003;
	Sun, 25 Aug 2019 16:19:40 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id BC892778B;
	Sun, 25 Aug 2019 16:19:40 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E3CFF7694
 for <cocci@systeme.lip6.fr>; Sun, 25 Aug 2019 16:19:38 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x7PEJaVj005928;
 Sun, 25 Aug 2019 16:19:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1566742774;
 bh=/p/vGVMF2/QNcrtfDRfrWc7YXN8dmp7WROtsebWGYX8=;
 h=X-UI-Sender-Class:Subject:To:References:Cc:From:Date:In-Reply-To;
 b=LcB2I9VD0iCDuJ1VAyOa2eB66PxdctdeSWB9RXiH806WTRdQTklTDsTiYNjIs5VnS
 iO3E9MS0k3WJ3W91QHotjgqfE4ft96xlLZBlVp9/2/9X7rJBV6wDougja2UlTZDUks
 67DKG52CZAuVLEcHaths/SWAEkO7miCJTSI3/k1w=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.160.204]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LdVty-1iRdf53Q5S-00iiZ1; Sun, 25
 Aug 2019 16:19:33 +0200
To: Julia Lawall <julia.lawall@lip6.fr>
References: <a7f12c28-0f96-d388-f1f4-57db4d3d880d@web.de>
 <2AE15A09-F219-43DC-81A9-73C13CFC0753@lip6.fr>
 <661aa3dc-3514-3d75-eb3a-9e46843fd02d@web.de>
 <alpine.DEB.2.21.1908251547420.2283@hadrien>
 <c6f15b8d-561e-fda4-1531-191334f1142c@web.de>
 <alpine.DEB.2.21.1908251741460.2366@hadrien>
 <3d06c34b-ad1b-2d5b-f36a-0de6429ad361@web.de>
 <ba5ad931-38a1-ffab-6730-2bf5b9981203@web.de>
 <alpine.DEB.2.21.1908252118210.2801@hadrien>
 <3f66998b-6203-aaf3-6476-ac324a6df809@web.de>
 <alpine.DEB.2.21.1908252209170.3506@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <a5801a76-5e56-e796-a422-f06d6b84a38b@web.de>
Date: Sun, 25 Aug 2019 16:19:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908252209170.3506@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:ppxwmflmNyFOm+g7CVHFccO7wCOni4mXCu8Bx7NEDjYaXG8YLSn
 0D1Z8HWIJuCovIW8hQc9YjgMuhC1k/tKmUIMoz0azeP5A4NvPljPJJr49PdBE5BCfeDRkbm
 08h8ZEqI1N00ijV7QP2tIsvisheRdcqub1QDa+/JKmGmIcju1sjfc7qprWBR0n/I8Wl9Sb5
 yk50ADq13DhLG+0Z9FpDQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nXeFZptkCnw=:oemuONQmzju13zH0lOUUdc
 D8p2vH/JzlVspu4h9nL+KX3fe/ep7pi91Xw2xlQcRDnKaUMOUzqsMdO47omiggFHe7+P7QBGY
 79GOhApCT1sLZ0wzYZzzmVFwXzPteq+LYlyGgWcV0jESoNJt6TKMcur2H+bIcR0yvwyw6AbiU
 PqruR0aqqMxE8kCno3hdhSmoEwP1CHOCepvRqR8Ji37IAchJ/YEU3R5e/2bPHWoZyAQJDYxnN
 EklmKms7DkhChccYxEv8q69XoI9e75pjg3MzNFZKqBnTwa/tBpsV9FQ+bRQ54WX+s+5RVJuBY
 +uQc2vEu8t+/MSrNLuHsCfBcyuP70geiXVfjjYCCGPwi9MvhA51ZXWTfb3SJUL6k2l+amMI90
 uQhjjEG6BKbeY8Rd1jYAQJz1u1C5A0RHdeZMXmZWtn/HWA6mx6f0wnmvusKp9vngZD7RYbXfa
 yzFQ/ID7Ze4DOoxibHS4F8ldfPe4hLUIeo3N0QExNF/zssrAJChNnA1KZy96/mNTxqHhQxv6a
 +u37XNapLc6T4IlSQkVKmyQHse2C+QyBwpf+C8qlmyZMJWp2o6Jv/1Iie1uGRhxVxaoJsMFC2
 JaNcIMKKCU/8b2KZS7rjjl4Nh5o584boI0Sia0EGm+140ejU3RXndEwR5vEmkdJ1wTgLTrdwp
 04WBrHnmK2+qr6K3pmiZM35l8OTBKxxut7mqcK0VHbBLNNx6zaLXz+shPnKdTcP9ZXVnnLiOh
 QETKF+gX8a70Moc5ap2pw8o0w4DLBlV4nYAV4LTpV5V+fp92jK8A/fwXZ8Un2mYD0Tqcwe2TI
 W7B3ZgQyfzs5pdhBY8mo6JpN0pTN8HjcdwMqpVhiddwXkQpaipZl8M2cOht+rXzwd/rfzyaL2
 F8uHK0AUpscOwXCmmAdKw/gyikQ+pZ4nAH8Wm+OSyaRojbMAOLFDMm6VOLqltD4+DUsu2mK4q
 cHzU7G13Tj1FFQFR03HezJWJTwDXQ63XsFnZDGTA2F3gOoc6MlA+xpoWQla4nj8Y9YP3LHhiQ
 lstLYOjdCx/+FpBK1YZaZ8QRnrchIpdYIupz+0UJcEIOczCaI1yLlNNoQebGlKK6944p9dkxP
 QBheyW3EzYN4zGk9SMsev1HKHeAlzr0wVMzy2jCYg606Uo+4EQs5z3hVJmxXa8uAsTyXaXy4H
 Ow8uk3mizTd/FrCcKmpk0auvA3Reqds5DalY0eduUJk0jS8w==
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 25 Aug 2019 16:19:42 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 25 Aug 2019 16:19:37 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci]
 =?utf-8?q?Checking_information_from_=E2=80=9C--parse-cocc?=
 =?utf-8?b?aeKAnQ==?=
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

> This is just printing for debugging purposes.

Should the provided data become better understandable by more software users?

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
