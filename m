Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C11551A5273
	for <lists+cocci@lfdr.de>; Sat, 11 Apr 2020 16:07:22 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03BE72uV027220;
	Sat, 11 Apr 2020 16:07:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B0C73782A;
	Sat, 11 Apr 2020 16:07:02 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 5103A7816
 for <cocci@systeme.lip6.fr>; Sat, 11 Apr 2020 16:07:00 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03BE6xv0005109
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <cocci@systeme.lip6.fr>; Sat, 11 Apr 2020 16:06:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586614018;
 bh=Aja99cT3zIDF6XypQV64D4JyxmestxboBovGHVHO7fI=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=EnCGLUhotPyprrLL5ukSTmH8X9uzPZSMPMA7UIK7HnjeuZLa7F3PZ68Ja+70M/SFH
 s7CtwuT40MQrBlzoGghxHsosvM4G9JWBxqw6kn6t5pkUQMtnO81G0r7y8Ge65Gi27H
 0rSwFADv2TJtp6n8kTBpfUYA6YEa49yqgMGUB5I4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.49.23.162]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M41Bm-1j60si2sra-00rXqh; Sat, 11
 Apr 2020 16:06:58 +0200
To: Julia Lawall <julia.lawall@inria.fr>
References: <146360ce-9cfb-e6f5-1601-fa95460c2cd5@web.de>
 <alpine.DEB.2.21.2004101712080.3039@hadrien>
 <f0b37f45-5144-a1c5-3f52-5bfbb6f3635f@web.de>
 <alpine.DEB.2.21.2004111600560.2369@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <de406823-0da5-cae0-a93e-7bbd96f1d1b5@web.de>
Date: Sat, 11 Apr 2020 16:06:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004111600560.2369@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:w1jF8kEjjTLujPBpPgaaxNMUmHq/gzgb1L/QJiMOkcsn0oT6PvF
 3N8jYhMgPrbtpli5TjJt0iv8NNgQ8KlX/uuZDox6T5CtkOIgnZFWtnXiehpkg7s63D3WHCR
 DbAUglEdWEf0grLfLh+P6LdjNVuY1pDku1ECGAxppOWn7V2NafdJZGkRZi03B8Bf7rN6FeC
 zduqRL9DNgB4bJqwpZvPw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IkI1qiVIZrs=:D31QGOY7ILNBhtrsIDkhPq
 fdWzH9wPUiBvNqMzeTMeEjGmz8+XmbsxlBYKwW9QxcN+TllZyMe9vlc1uppK3fFyL4Oqe0pNO
 2tq7UgH4s07PGuTM/B2cC3fJR6es1feQyEwRRGVHMteCKf9jID6maM1DKvwRxpzIyB8MBtch5
 O57Ay5AHWqZHZ7NKaGQnw2aLT4Btc1jGZ9Ewiw2ZYh6FCCtHZ+zx9HWjMgSQjtobefoj/6Dpb
 b+LW/tpN9LiVKzI9Nz1NY1QcmSyymcBE2VZhUyHSt+8ils+XVJuQvZ5gSAy2mL8SUN8cB+IpK
 J6aW06cSNLuKYo6TBxeN6hgVwjavY7D9mfH26lchBXONcichwObed3IlBhHJdYzhEyOZ7m9y+
 jrkA4qiwc+l7LH5Nkbz3IL8k2FH0r8X2ufLDE2zkwilMuMVfj1r0SskZZvxjc6YoJvqKX6daI
 PETIvk/ndqyTTmeuW6Fp22VsZFBVyoFZ8kcLU1iFZKl3yplR1McsmDuUmmHjFCzoiyXncuMW/
 rSg7ZlT5oloXoaY6ItIwgVsDfxHbUVD/gk9TyhOxI+JC1LmNUBzZHo0Pfkf9RB3P+Xdj1dIZ9
 3nTSFPRRmZjeOJotPE7Gg5aub55YONaXnZvjHfmd7d2o2AK5RXSbqZ+6mJB0N7GHjfjT1ZWPl
 er6aLrPj4nZO4Ay35bynpBaGgfZoUHvZfERDT7koLNPQvL9vVGrNIbuzPGP+RGN5xaSfTAkqS
 f/gz9NhhCL0VyQG1AHDHjHTIAlKhfHaXbm2yZdjx9yUL1XXDRWibvOxszhPtVY/HJF6/kUnIs
 +0oOQl3zFOSKDw6ciZonXSd25ha1hpyWEJlhKitHMIEiQ9T7/JZLgn3sU/wIlJuYFdsljrOoW
 GIStJUunFZ9ZNSq94NSEUPtRaIqBXErtPvU15PlkV+yUtlJwmFUK90bSqWtl+8klHS8M9YMBV
 uDcfW9FIyOap9Od0LcyZX0tNSztmysFa9JSZgtEkwEMvHNOmDAOmdvVGz96zhDAdmy3fethBk
 ogF/m2p1ft2mrHG5W1sIL7cwAEcAIC7x8/oeqZfI5itGcdRwbEQFxP5NRfz62AJKA+B0CJwiA
 Ub03cOAgd/jvFNAGPOpBdRtW1O59L/ZBPnJzpu3nKj4CH5SORXpdmcG2VoxP6QDIKCX4Lb+eX
 g+DV1zfMt7sv2F1NVAOvM/hPgyAINSWEkyVrO6WoIqAGi8NoSiDrbadRTnOrt3Rv+UlHOOrXi
 pICeErj6AfoXESanK
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 11 Apr 2020 16:07:02 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 11 Apr 2020 16:06:59 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Reporting variations of condition checks according to
 function calls
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

>> Would you like to display statistics around the distribution of condition
>> checks after function calls (with help of the semantic patch language)?
>
> I'm working on other things.

Thanks for your feedback.


> If you want something done, please do it yourself.

I assumed that you (or other contributors) could help to reduce my concerns
also around limited data processing resources for challenging source code
analysis approaches.

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
