Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D77213D81D
	for <lists+cocci@lfdr.de>; Thu, 16 Jan 2020 11:41:32 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00GAetKf012981;
	Thu, 16 Jan 2020 11:40:55 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 5F2D377F7;
	Thu, 16 Jan 2020 11:40:55 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8BB73771F
 for <cocci@systeme.lip6.fr>; Thu, 16 Jan 2020 11:40:52 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00GAek8i015448
 for <cocci@systeme.lip6.fr>; Thu, 16 Jan 2020 11:40:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1579171245;
 bh=EScmBhhO5kUzDHXNuzFa23Tbu62Dlv2gUfbuZgOMxEo=;
 h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
 b=ATQZnzG5DtUe3oyGkWpsy79GlLjl/xCJ0JWBpwd4k5XyRkGO3XMTd79VACqvBqt3x
 3qANCxD4Dqlz+pv74k+X9T99JAjOoCvX01+B7OihEiiZGqumxYf4ak/BUWXtujr8WH
 hL3XVcNWFh2VfDvjYpgUPyCpzo6TGdZIm1W4HhzE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.6.163]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LlF82-1jT1UQ49pe-00b5oM; Thu, 16
 Jan 2020 11:40:45 +0100
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>, cocci@systeme.lip6.fr
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <1090dc9b-9556-f6ab-23dc-f7d0a8176220@web.de>
Date: Thu, 16 Jan 2020 11:40:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:4AtXJ0JU3ARcv1yxkHbDdDviubp3+WJqsPUc2YcmLB9qvaCh5B4
 3DhyJf0u44343U2v7iG+29VuhQe9Hj/aBr4Oi04xczK6V3aQQ88kjjkTuFg7pIb9+CetrrO
 dBL3S31W0Yj9brS1y5DJPN9IydmtUPfDLOt920PbfLCN08aPu5b7yQEGEZqDejX3t+PfoLy
 gSfu7BM1hM2FYl9mqdSFw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BMXgvjRXvtk=:tZ3WTVGv+KMjHm3/Ds9E91
 Oy3Lnwf5AL9P4kJFxCUH2uWTbcFZiX7ebdNcOJqPOY7dEUL2Jsqkl7/+FEUD9rloW6+7A3fXO
 iYRkUcWCwPhJmvDV4bqtZxwkIJY6tf7MTBdx50rrcHD8XIy8HYtXUV9FLj03igRc/NqWTVwyn
 bnmwjRfvLgkOZaEVJesMqdpvrSC2b2sJK6bHHPhcbVsjbirfGPm8T/u5Nuj1ZY1G7JoOpcvPg
 K1mYgZ0wq3yXtK5LQSA94kTDhLvn3w70PpAUKx4Q3pSjAjySiKJKwm9torbQPgwf4ipCiAsHB
 0KHZLAiRCufx0Z25HUxOwnvn5gNzyQsTUGDgWA9WOoDuNvPNbH0P6OESKh1/2w473EGevHBC0
 alpycq0uONz0sGH8zheBg0SWltnRLavkPwQPIhPgj7C+YPj/V0qnnabyO+emS/tajbr1mIjEM
 7R3mR4+B7IwvlJGfBlcupbOSr5asvTjVrgxkjMNUWaX6lI4S6iyzZYtRhZR59r9SIkABcTuDS
 w9uOW0WifXsK04/h5Ofln8hkIaWP0Ghc3rmfplocsoH+MsPAK8xdLl9UzicjDr7t4ZORfl6nK
 1wgniYPmPhE8BaJHmS0TvDtasWPSa0oRBXNbPBi7nxeuMOlFo6cHCqi1MlO7Jwyv44WA+5h1S
 To4Ly7zp9cmjqySJJRNgdngcNfeCq5A488r1kSESltbTvxPl+5Z4VAB38NHfIDEW3PsMOXEdc
 ju/y0sumziUCW0SsG2uE5AwzT3Cbq3XNLAO3sXhTLfkzaKEwJD+5hCF2W0YjUz+aNMy5Yrf1k
 N5/Y+IHrn4bkA49p1cNT1UMdc+T2pc1fbYq3w5rjxjZgi+lxxh9F1L1AEzBPQ2DPl8ybrNkjR
 xCobh7EwmmN+S5zCNfjxd1C8vKx5cP9Cby9Elz1mnr1eR9HQbq+dAMVBQRoBokyWLTNtb12Dr
 EbqKzCpqtrtyDDS4z1brkwI74DTprvk/V8BsJNJ+NBUYaA4CIYGvEqPpvFvkq8EHORBmImjFN
 TXfCMIZeVrAy2PnGNb2eyrfJc63ssnl/++skXD7U9Uxh+edvzaJ7pdIt9+c7lRb517e95bvzY
 GLwdEJnWxDbqGfVokl2yQM+Q/XK4VmWTSt2Wf8IqLHXDNabFSxvS4TCKRqQeVS2fgZibsJgfj
 F7hAEw3PZbwTczVwhvVj/e0HSEh373INdGicWnN+N15/yHXyM6JS7SFfqzR8mmnCN4c4QpyYC
 4SgTXH/9w0Hf8BB5Bj5S9SRND3Fyp1Hv1al5lQbSj8sSZOrHmDYQcCb9/L/c=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jan 2020 11:40:57 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jan 2020 11:40:46 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Cocci] [PATCH] parsing_c: Add space for tokens after *
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

PiBJbiBjZXJ0YWluIGNhc2VzLCB0aGVyZSBpcyBubyBzcGFjZSBhZGRlZCBhZnRlciB0aGUgUG9p
bnRlciB0eXBlLgoKV2lsbCBzdWNoIGEgcHJldHR5LXByaW50aW5nIGRldGFpbCBtYXR0ZXIgYWxz
byBmb3IgdGhlIGNsYXJpZmljYXRpb24gb2YKYSB0b3BpYyBsaWtlIOKAnE1ha2UgY2hhbmdlIGlu
Zmx1ZW5jZSBjb25maWd1cmFibGUgZm9yIGNvZGluZyBzdHlsZSBydWxlc+KAnT8KaHR0cHM6Ly9n
aXRodWIuY29tL2NvY2NpbmVsbGUvY29jY2luZWxsZS9pc3N1ZXMvMzcKClJlZ2FyZHMsCk1hcmt1
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpDb2NjaSBt
YWlsaW5nIGxpc3QKQ29jY2lAc3lzdGVtZS5saXA2LmZyCmh0dHBzOi8vc3lzdGVtZS5saXA2LmZy
L21haWxtYW4vbGlzdGluZm8vY29jY2kK
