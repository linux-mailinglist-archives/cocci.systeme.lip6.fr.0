Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E201B65C
	for <lists+cocci@lfdr.de>; Mon, 13 May 2019 14:49:28 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
          by isis.lip6.fr (8.15.2/lip6) with ESMTP id x4DCmjFL016882
          ; Mon, 13 May 2019 14:48:45 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B68337753;
	Mon, 13 May 2019 14:48:45 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 32513773E
 for <cocci@systeme.lip6.fr>; Mon, 13 May 2019 14:48:44 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by isis.lip6.fr (8.15.2/lip6) with ESMTP id x4DCmh2E018780
 ; Mon, 13 May 2019 14:48:43 +0200 (CEST)
X-pt: isis.lip6.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1557751713;
 bh=ia/0oUtlZN9RDMwCwCbrdvO24eNBtdtByYnaGrjeuSw=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=nUmStdf8wepCQhjZZtrWyvxmfZQSkZUwT6AywdAIpxZGLiI87mxGFOV+ENGumM2bN
 PI8pV1aOKY7T8dTn3CqCfyqPkCQjf976W0jTPGwsgmur/lVGg5DFYcdqVprkx/ou0W
 B15muyt1/ax15hIY8pkda8VCdPIbGzSIwe+eiiok=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.135.147.80]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MbMg8-1h9aw11Wz6-00ImWQ; Mon, 13
 May 2019 14:48:33 +0200
To: Julia Lawall <julia.lawall@lip6.fr>
References: <1553321671-27749-1-git-send-email-wen.yang99@zte.com.cn>
 <e34d47fe-3aac-5b01-055d-61d97cf50fe7@web.de>
 <308f5571-68f3-7505-d5ad-59ee68091959@web.de>
 <alpine.DEB.2.20.1905131133570.3616@hadrien>
 <97f32bc1-f7ff-5777-21b5-5c4f85bb7276@web.de>
 <alpine.DEB.2.20.1905131333560.1009@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <55b48b0e-f0e6-d46b-2648-0d2cb5c92c8b@web.de>
Date: Mon, 13 May 2019 14:48:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1905131333560.1009@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:M+lyAB8Dlc7uil+O7RDRk6k1sOngr2dGwm4iuyfnq8Lrv8vHyZJ
 n+n4Hft4JZDvJPQ7qec0g51YJo4Iwc98sucrYuax3ur47VmiQt61et/YkqO2ik6GKYrAPS0
 8NAaVAHJtv+5GaFXUQxM2GYD1hLqQltNZwMzOL6MfJZuZg5nbyy5jQYcsx3Z8U/PVJ27VGh
 UtY3Ov9dMIp3mM2wxQkXA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gpRer87Mwmo=:+0XEtpuifDtp+ia6LIGl28
 vi/rNQYWfNP71QrufVVQrkchCRYxv3ndmVqFXBZYMIfg9qeDNaZ0eFa39SfHp/U9XDJ5N+7rA
 HNnKZJCrUIYIYDzmH27HmGORZUNHn4cl22Jl3SGsKTFVuDnX+y8Kb1AxF6l9AHlNKqoNcAKZs
 nV93DNMphvMidXI1kx95ZevIYNWsBzBgVzJilFsrjoJj3oulMrUMvkvJ3GKWToPvH6rcxPgdh
 npNggfZp7PYBtVs68V0qEAuCWenrYBdikf8Aag14PcEvaYI9Kll3lFrZWTgWTKxAGG1y3qHU4
 S6TDGBWw+CNIe+3xf05ofueDQcAO1ZdPU1bdF6F03Ds/72Aaw9HPT/IgDKgbNy+EiyqJH+VWB
 tP6Bj3QhJxqBmF7TxWD6K2zKDxyXyuPQhLornVGRu8PthYDcMb079dDdnOBp7NpdYLsPTrkJJ
 9NVjBHjyK9IPR2M/CYT5Pn1AVHsEWf8IBHGldcT2rQ6U2fU8qhwi5KwQvoZWQZ60+14RXC0nK
 IEBHn8HlIOXIkn9KYw9AZUG2Jnzbbx2Uk9ZxFxtQ8VFkO2t7HITK5lTv9IqCHoLRPJV/Lmztj
 W22E+kgeFI64nZVQmngQs1A5qSgV4T0kMHeil6UYilD21aj4xIutfvtSpcgedhwHCH9ixpFJ6
 Z7SPSzj9GaQfzHnp1EMtAMvtGN7lFxXpt4ZAl4kntpZd2bVLmPrY5UeGiUbu7NYAcCVzVal26
 6GeGEmGl4Z1TFUlLXQNZXu2McXlniQb4r/JXrKcnOAcsLSkmOFC2nyDdF1hI71OxeCR8Eszx/
 6VtW98hDPcxKEh14ZSSvlC3sEJbbqv6Hmz9mshQBOuNpfaCfKlZSQpZqOjZiAW8gvKchGyCVu
 Ufdh395+zkVOI4mQ7ZlQebRrWjZpXgXu83N+R4L2s891c1+DDe1if70wSWV2lTj8YMOIcp941
 kmZ8MtEB5gg==
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 13 May 2019 14:48:46 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 13 May 2019 14:48:43 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Wen Yang <wen.yang99@zte.com.cn>, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [1/5] Coccinelle: put_device: Adjust a message
	construction
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

> I realize that you don't like it, although I have no idea why.
> Does it make the code slower?

Would you like to compare the run time characteristics from creating and
looking up an identifier for a Python variable to direct passing of
a concatenated string for the desired function call?


> I think that staying within 80 characters would be a much greater
> benefit that all of these baseless concerns.

Are you aware of another code formatting option?
https://docs.python.org/3/reference/lexical_analysis.html#string-literal-concatenation

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
