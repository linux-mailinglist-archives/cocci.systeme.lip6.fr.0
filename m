Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE04C2A518
	for <lists+cocci@lfdr.de>; Sat, 25 May 2019 17:21:32 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4PFKoPl014135;
	Sat, 25 May 2019 17:20:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C47AA7760;
	Sat, 25 May 2019 17:20:50 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 22A3E774C
 for <cocci@systeme.lip6.fr>; Sat, 25 May 2019 17:20:49 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4PFKmP6007643;
 Sat, 25 May 2019 17:20:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1558797648;
 bh=KtM4n6gqcib27tm2CbpjLtEIWGaY5MtyYLX2HADSPxE=;
 h=X-UI-Sender-Class:Subject:To:References:Cc:From:Date:In-Reply-To;
 b=SatxNKInSYwKnf24UDB/zT5QpiG9zQJ8FRoioctH/C6JyAdvp/oMgQgDXTJ6DgDi8
 LtrgMhiTGoBkNkRfgjNXe4AmFy38ojimAnNic6x7aDc3iNmeUbzcIKxmVzFxJhncaK
 UyKFuykqnBQHrtSTLSPOlxl3oXafvt+lOmoFQLcc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.4] ([93.131.6.10]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M7sw0-1giD4q15Jg-00vQbM; Sat, 25
 May 2019 17:20:48 +0200
To: Julia Lawall <julia.lawall@lip6.fr>
References: <alpine.DEB.2.21.1905222114490.2618@hadrien>
 <81b409c6-5986-5961-5edf-843c6737d88c@web.de>
 <alpine.DEB.2.20.1905231500230.3573@hadrien>
 <b5c322d3-3162-953f-a985-53abc5064482@web.de>
 <0782D580-3DD6-4419-B5E1-C04215FB2E3B@lip6.fr>
 <bcc5a120-dc66-7511-a401-e14c322dd67b@web.de>
 <4FE72A81-9D85-4786-898C-A84E2AC5B520@lip6.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <20bd8b39-015d-4919-d0fe-c92eff9d7cd4@web.de>
Date: Sat, 25 May 2019 17:20:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4FE72A81-9D85-4786-898C-A84E2AC5B520@lip6.fr>
Content-Language: en-US
X-Provags-ID: V03:K1:0N9QcvUjMSWd3Fv5thy5TLz/NCLX0R8poDedHz4zFqILFtx5QXt
 T8OekpPc8RniiW5xp03k+VX9nW3zyGPB43YC8fFq8BPDg7fLOKyMw+piZ/tcSiXSGKXBky2
 8tXl+OeZd0xeXfin7NFDAx39udIlLeGlk025Z/6BOZ/oA6UNCQ14cUudbNHnHnSHnWqxiYs
 12SOszuT+udNIiEmUF71A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kTu79Pgexo4=:o/9VjEdINOFKK5r5XNV8wz
 mhYBhL/RtDq9qf4+Z7r4RJAImeuA4Aw9w3ZhZ0oA8GjkarfVWpTZp4ncvbr2KsXpXQocWUBU4
 IS3+mgePCNcpb+gsc20zJ0eKkib7pkW5zgLgP2AwmPVKnkojj0v4ZHndYIIgfNexH6AzUdMJH
 mXHyEpavbABpdjUYeZE/rq4Ry8QhHfwWtx0d4grnkchVbBqwJiMyYZvVKRvn9670Xgnb0IyAa
 wbtlowSwsOjKkPY+zJdPUhRI8B9LIaJk5C5weNesqjb9sp1FQ8vfXH93kcD/80T6bIZCCXoDg
 KGbSxOxlYm24LpJGqf63M7+NSF8qwnrXASUh+tdLufDon7cvhHKH6BB/DS1MmLu4opWu0zbV+
 Z+9XE5vr9OtrcmqPxIQYbODluMIQPuUVF7Pl9Omw8ZX4uzmjyHOopsY6pRytG6LrxcUUetGCD
 0mlO3jBpDNs77Lj/ljw7JB2WXVyYUWK6ezjGcFv2RVkLcyZnQvhWD3M3s3X451DaBzXE+XXu0
 GxpJX9BuLaKTis5z4PgE4sxo4anBhjwAk5HqTFpQA3LPIcCoWBKWdu+56CRV+oDcBKCUGMTac
 igkzNiTDhTKWLZpi71DxxECfXiqYOONhsVuVTZlT65FQ/PWnyeu+LJr74tg3PDpb6Y/sHJRJO
 yCedY00nODZeDpxCEUVOft1Dado2RbrStGIhmm1fJwf6d2ndOs8YHm6ted55XYiYU3Yw97Mn6
 XvpLtWU+z9t92oM3HqKqJGGeLFdgCJUGtACfNxwfHPpDV0vp6g1oDmQ3Pph2QQS+t1DLUCJHj
 onhokD4K4vFTg1ZX7Ee0as7RA1pQUsl2SsAI4tTbBtiN9GiLjPAQuaeV1L/CsrdzCqdz87Siu
 UQqm7AjO9eBRHBkM0UHZ6MEuj+1MCDK6a8THnxBjtB1b2kBAuwC/dO5CuVT86jXF2kEO5BY9L
 vp77zaEG5bmUyZzqZ/4cmDdDzB9lBVc9yQCu4zV4jOWJNJZpe2DIA
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 25 May 2019 17:20:54 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 25 May 2019 17:20:48 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] accessing comments
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

PiBUaGVyZSBpcyBvbmUgaW4gYW4gYXJndW1lbnQgbGlzdCB0aGF0IGlzIHdpdGhpbiBhIHN0YXRl
bWVudC4KCkNhbiBpdCBiZSB0aGF0IHN1Y2ggYSBjb21tZW50IHdvdWxkIGJlbG9uZyB0byB0aGUg
ZnVuY3Rpb24gY2FsbCBvcGVyYXRvcgoob3BlbiBvciBjbG9zaW5nIHBhcmVudGhlc2lzKSBpbnN0
ZWFkIG9mIHRoZSBpZGVudGlmaWVyIOKAnGZvb+KAnT8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpDb2NjaSBtYWlsaW5nIGxp
c3QKQ29jY2lAc3lzdGVtZS5saXA2LmZyCmh0dHBzOi8vc3lzdGVtZS5saXA2LmZyL21haWxtYW4v
bGlzdGluZm8vY29jY2kK
