Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E39432331
	for <lists+cocci@lfdr.de>; Sun,  2 Jun 2019 14:01:27 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x52C0iJA014498;
	Sun, 2 Jun 2019 14:00:45 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D66027758;
	Sun,  2 Jun 2019 14:00:44 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8CB905852
 for <cocci@systeme.lip6.fr>; Sun,  2 Jun 2019 14:00:42 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x52C0f3F001337
 for <cocci@systeme.lip6.fr>; Sun, 2 Jun 2019 14:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1559476838;
 bh=UBqM5vAGyscrJGUxNhn8fLMeNVEajKFn8XS+WId6vfQ=;
 h=X-UI-Sender-Class:To:References:Subject:Cc:From:Date:In-Reply-To;
 b=sL6Z+8Et7iUWoa+rje4OwQewk11vNeZ0pvdV7bAY8LVmLmeNfT473Xd8lY84fRYEz
 zIQBzY5UrFbcSpk2RBuhHTbXNO/vUukX/E1DPULLtmSe2j31LkHLWiG2zxi79h65Lt
 69tdE7QRAP7/hTu1GgBjoukce/Dqe8g+G23sEUe8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.4] ([93.131.86.186]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MNLS1-1hUuCN1TJJ-006y4U; Sun, 02
 Jun 2019 14:00:38 +0200
To: cocci@systeme.lip6.fr
References: <alpine.DEB.2.21.1905222114490.2618@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <84555f2c-9bc9-c4de-5a76-e68332715fa3@web.de>
Date: Sun, 2 Jun 2019 14:00:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1905222114490.2618@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:QuuYmIAqDJO4QtVJdU3FQ1mbfxTI60N5Cu6uSKuy6uUZ5IoZlGx
 REucmRt96evYCopD80LIqnBJwJIetLKuXuX9UWIzlcH4tdpFjhCh/RmG0q0wa+CT+hFRzBV
 hWTRhm6kIBBH4NC3KiOkBfSrHcWD/DxBxCT2CZRyQXxJAWOmgQ8vP5BSK6RnVJ2bonHrY3I
 8im/3oLfl0TgKk73UDuYw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eUmxXSSRuTE=:fNgMS1i+vkMZ4hUTOesAb4
 m04xM64KTFIRhC4UYE5NNkRAg/xzxzqcRji24oFW/rn3C/MBPJwbOTuU8ht2pKm9vD3H3/6IB
 WO7uzC+NqiyEiPYA+qdlVqIWVkBfEt0m6khDQgN1/+e/4HanAYoZMUVDoH4/u2fDrFSVOtio1
 VFxn+wx4fguMjFj39HmSU8wVAm/lzSnm4qTbzVJabxXd97jxgnWgbBBu0Z3xQgFXjhIjBrV4h
 hzOf/DNHSW0VLvLGs6M+MIyx3ohpHjmUTgVw7c0vZGAoqZIm4kohLvxlXCqzdalHXSM4WeFDZ
 KfKiHng12kJfVTJBJ4pZnly8hlpcy8vRUi63Grb2dGscp1Oqf3XpAPb6CAA4KhYbBRk3ypwc5
 3O0IIbuWEFHAOyqSyCOUxwruqhCrR34zcN6EDBtCSxvDRzg9L+58899gIi5k0MIRXN7CT3qiW
 /0QCUkYgHCTckgzG3fvRFpMgTo1QQ0L3OZP3p4j4MNcmQBZPO65mK9B4IW/Nds0ACB0eshXbr
 oiPTPIaCG433KfLp6kRf/0tjpLAgz+jFR2EV61TZAWV62Dtws9ew2KnMEMLHdqzSisfTdTVXk
 C8vweZSRQZlWaIOTgdQwTZmC7pr73b4+oLnu6kqWwDRvXotMpSuyRiyUoD2/xFw5AbNEbH47Y
 85kRTtS/L/qwZ+uQ30wilE1/qsjarWDTP5jn/IzhX9KYJ4i8xuqurK1w+Nhz0g/J5hYXWoAlP
 r12xlYry96WA9LBuKuqDLJH1sOreoEhX7qoFe0K9C6GrLKko8Kgw0u86kAXyGWh5jUeX7C59S
 kTL+e+dDmx7e/9KGF4jUoKru0vf5WLIqnzMqGQNvHMXwgvbRWvnkvBq3ctbQJr5JQNaqfzsxO
 J+TopFSOQkydjo83o5RwSA62/6bVvaEdsuDVjysbqSO5FXn3bL5dcRmROJ5Usnw65kPlDXW19
 wNCU+o69Fnsjid/4QfXrRyzbs7iJaQbOtkiwydcVCZNqcTWmKt8oH
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 02 Jun 2019 14:00:47 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 02 Jun 2019 14:00:41 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Wen Yang <yellowriver2010@hotmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

> It is now possible to match the comments before, within, and after the
> match of a token, via a comments metavariable.

Would anybody become interested to discuss corresponding software development
challenges and fine-tuning possibilities any more since the support for
the Python programming language was added today?
https://systeme.lip6.fr/pipermail/cocci/2019-June/005934.html
https://lore.kernel.org/cocci/alpine.DEB.2.21.1906021038020.10641@hadrien/

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
