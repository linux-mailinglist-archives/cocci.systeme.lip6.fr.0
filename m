Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB78100590
	for <lists+cocci@lfdr.de>; Mon, 18 Nov 2019 13:27:31 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAICR0TS021289;
	Mon, 18 Nov 2019 13:27:01 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id CDFA777DB;
	Mon, 18 Nov 2019 13:27:00 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 60EFC77C9
 for <cocci@systeme.lip6.fr>; Mon, 18 Nov 2019 13:26:59 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAICQwQH022534
 for <cocci@systeme.lip6.fr>; Mon, 18 Nov 2019 13:26:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1574080017;
 bh=Cz4YdbtBfCdZe3JaQ/B+osIzWg0sPACCl1smuJS/y04=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=foj+rT1Sr2lbO0Yf0wL6abfzFzZgIEFVcqGDapHHbjSS0kh2O2o/7jiTxJJPE/Q5q
 SA0nBJPvHSQInxmaNay8QsDmb39a72Ws+O472aG4N84EJtbLnoPoQNWg2U3U31U6Sg
 y+b52Me3oMDM1YY1RI4D/zjT2FnZVdUCyzVJdmk0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.49.191.247]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lc8c5-1i7Y7I1jSn-00jZd0 for
 <cocci@systeme.lip6.fr>; Mon, 18 Nov 2019 13:26:57 +0100
To: Coccinelle <cocci@systeme.lip6.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <f1522779-5d10-a1d1-0555-795af612d8b3@web.de>
Date: Mon, 18 Nov 2019 13:26:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:IDmVMaXwFeY+tUD35TlLd+s8aODiqGlFAZqh0fZ/5UFER4IsnTL
 t04b6XBy0zEmmgZ84zsKa4ns41f6GPcfUJ+MTTgczWp7OECREXcinH86MM6PuK8sc1CN8kN
 Ph/Yry5/r4lpCPYNw+KtsibkBk7fe+wCjgCq0dLsVd9wQfXL6dC54laiSHXf3cbrIzKvWvt
 yNRjhpmxlcYYm29zAAlyQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jVbkdX8fUso=:izffPkaaPqsisfmRtBvWmB
 0nJjB1PDEHptDOVllacy1JrddKeXJvKn3ZxE3WLyoQds/o4WVfxZP5R4AL3oHVo3J+BQ9mush
 882yGMQfs2i/FWBHqh7KbTzr/KPm7vszwzXkxqTKDmDObCx5WOzF85RV48NHPjqgb9P9hgsJE
 Oriktw17WJyuVnPHNYt0kULeGZp5+zxFMrGo5XdXbuJUK8b4jLsbIooABrjgYK3VjIwCYl6J+
 7YSSwnHevk2VCreZ6xG/nLp5m7e3RJHWt7qWSFZK8I0A93fPCe4BjfGArdI3yramgZsWTBwjx
 KT6DoknwbLU0YcDTRIDAC5ur6hybNwGJFflqNdiSElBRIJcufSQqQiinJEL33nxsMBUzwkZjk
 C/haprYf/L3O2D59rBaGYFBagALrsOZY4+t/wcRhj1EzEWNNCugvPQi1rMPu5SlEV1yCuB0J4
 gDP8crYOsxRT/yhbXOU+LCT4HAfAV5t6l/2h9XhycoS8Lwt4OuWeuWnNCh/WmvdOZ2xEA902b
 VCZZPJUEjFHY+nDGi4VeTzjwLwrGD5F8vjB2tuEFVf97ZkEY0CZGmn1ZV55mFJkwMJCL+2FIA
 9AVcUslaxBxcFOAJz7hHbyqIRJMr9iYbtA0+Rsfxx83gtSOTzZqnsvhzeZLITBbVFG7C3+Wd1
 96HJqGc94ldlxRMbLan4YNvto+j32c7NHjywE7k646tpBDG6KrS6wrkNl7+N19PJrt8E3R8it
 nPNos8lpBli+qkIf4pqKJ/b33NowiIsDegR116H5Pqv+q5/dfV/yMPWKnyqLbA+MVvRBfw5eZ
 AktrrweUJakPEmJE1i+6NbDYQKv6IYmV3KUgbVvtFAV+beMVfMMzMQijzhBrc1LPR5Nbm2NCt
 3pZzlgUk6nNEEvwRir0J2hJ2SSznWO9CFoULY7ans6hxgxVwSMuj07SM70xYrKSFBhePxK4LU
 vtclh6CVGrpDoJHukcFyUPS3fFlDCvt4cJ7Ckr9l7eUZiVxO+vOyFPR6ZB0WVynHGtztZ+ErL
 226a3deA4M0P2IGBrYkc71uF92qPgKyfp9Xw8F4K8wjw0V3KFApWDiz4n4Ii2hSjUVVxrBGKB
 n8KFvQKEZgRSCzLre0+GGUOuBbEExRVH9UgLC3iTCenLQoVLSNTJvcrSGWBe6yIXnRb8yMhBJ
 zngmN/pxPujqBqFIqPOXqz+yKFI/jUIGpK/X0s1rL/YtTPOo4j6Fj1ErR70f5KtBXQ7i8oKfP
 YljWS4FwooV+vpAqt51tVmnxGv0yU7vpnbfMGG89Hm4zqgUfDtxCLTiw8h5k=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 18 Nov 2019 13:27:05 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 18 Nov 2019 13:26:58 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] Data processing with pointer types/expressions
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

Hello,

I am fiddling with another SmPL script for a while.
https://github.com/git/git/blob/177fbab747da4f58cb2a8ce010b3515c86dd67c9/contrib/coccinelle/array.cocci

My software development attention increased then also for the used metavariable
declarations like the following.
* T *src_ptr
* T[] src_arr

These worked to some degree. Now I wonder about this fact because they were
applied at source code places where pointer expressions (or arrays) should be
passed as parameters for known functions. The provided information corresponds
to pointer types in the shown use case.

It seems that there is a risk for confusion for the desired data processing
when also arrays which store pointers should be found in the source code.

Can corresponding type variations be clarified better?

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
