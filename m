Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B41B548
	for <lists+cocci@lfdr.de>; Mon, 13 May 2019 13:52:20 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
          by isis.lip6.fr (8.15.2/lip6) with ESMTP id x4DBpmWt028317
          ; Mon, 13 May 2019 13:51:48 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 34F9E7753;
	Mon, 13 May 2019 13:51:48 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 6E084773E
 for <cocci@systeme.lip6.fr>; Mon, 13 May 2019 13:51:45 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/lip6) with ESMTP id x4DBpi7W028852
 for <cocci@systeme.lip6.fr>; Mon, 13 May 2019 13:51:44 +0200 (CEST)
X-pt: isis.lip6.fr
X-Addr-Warning: ATTENTION - Votre correspondant a fourni une adresse
 d'enveloppe @lip6.fr, mais ce message ne provient pas
 de lip6.fr ! postmaster@lip6.fr.
X-IronPort-AV: E=Sophos;i="5.60,465,1549926000"; d="scan'208";a="305811236"
Received: from vaio-julia.rsr.lip6.fr ([132.227.76.33])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 May 2019 13:51:44 +0200
Date: Mon, 13 May 2019 13:51:39 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <1c36d747-ac2d-0187-ddb7-d1a2bb18ddaf@web.de>
Message-ID: <alpine.DEB.2.20.1905131350330.1009@hadrien>
References: <1553321671-27749-1-git-send-email-wen.yang99@zte.com.cn>
 <e34d47fe-3aac-5b01-055d-61d97cf50fe7@web.de>
 <6b62ecb5-ab88-22d9-eee2-db4f58b6d2ae@web.de>
 <alpine.DEB.2.20.1905131132250.3616@hadrien>
 <1c36d747-ac2d-0187-ddb7-d1a2bb18ddaf@web.de>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 13 May 2019 13:51:48 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Mon, 13 May 2019 13:51:44 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Wen Yang <wen.yang99@zte.com.cn>, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [3/5] Coccinelle: put_device: Merge four SmPL when
 constraints into one
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



On Mon, 13 May 2019, Markus Elfring wrote:

> >> An assignment target was repeated in four SmPL when constraints.
> >> Combine the exclusion specifications into disjunctions for the semantic
> >> patch language so that this target is referenced only once there.
> >
> > NACK.
>
> I find this rejection questionable.
>
>
> > This exceeds 80 characters
>
> The line became 105 characters long.
> 14 space characters can eventually be omitted.
>
>
> > and provides no readability benefit.
>
> I try to stress SmPL functionality in this use case.

That's not the goal of the semantic patches in the kernel.

The rule is fine as it is.

> >> +++ b/scripts/coccinelle/free/put_device.cocci
> >> @@ -23,10 +23,7 @@ if (id == NULL || ...) { ... return ...; }
> >>      when != platform_device_put(id)
> >>      when != of_dev_put(id)
> >>      when != if (id) { ... put_device(&id->dev) ... }
> >> -    when != e1 = (T)id
> >> -    when != e1 = (T)(&id->dev)
> >> -    when != e1 = get_device(&id->dev)
> >> -    when != e1 = (T1)platform_get_drvdata(id)
> >> +    when != e1 = \( (T) \( id \| (&id->dev) \) \| get_device(&id->dev) \| (T1)platform_get_drvdata(id) \)
>
> How do you think about to extend the Coccinelle software in the way
> that such a detailed constraint can be specified on separate lines
> (without duplicated SmPL code)?

This causes some ambiguities in the parser.  No change is likely to occur
here.

julia

>
> How long will it take to reconsider corresponding software limitations?
>
> Regards,
> Markus
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
