Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3BD7505F
	for <lists+cocci@lfdr.de>; Thu, 25 Jul 2019 15:59:18 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6PDx3Im027727;
	Thu, 25 Jul 2019 15:59:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 5A81F778D;
	Thu, 25 Jul 2019 15:59:03 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3F17B76BF
 for <cocci@systeme.lip6.fr>; Thu, 25 Jul 2019 15:59:02 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6PDx1SY009922
 for <cocci@systeme.lip6.fr>; Thu, 25 Jul 2019 15:59:01 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,306,1559512800"; d="scan'208";a="393304252"
Received: from c-73-22-29-55.hsd1.il.comcast.net (HELO hadrien) ([73.22.29.55])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 15:59:00 +0200
Date: Thu, 25 Jul 2019 08:58:58 -0500 (CDT)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Joe Perches <joe@perches.com>
In-Reply-To: <a0e892c3522f4df2991119a2a30cd62ec14c76cc.camel@perches.com>
Message-ID: <alpine.DEB.2.21.1907250856450.2555@hadrien>
References: <7ab8957eaf9b0931a59eff6e2bd8c5169f2f6c41.1563841972.git.joe@perches.com>
 <66fcdbf607d7d0bea41edb39e5579d63b62b7d84.camel@perches.com>
 <alpine.DEB.2.21.1907231546090.2551@hadrien>
 <0f3ba090dfc956f5651e6c7c430abdba94ddcb8b.camel@perches.com>
 <alpine.DEB.2.21.1907232252260.2539@hadrien>
 <d5993902fd44ce89915fab94f4db03f5081c3c8e.camel@perches.com>
 <alpine.DEB.2.21.1907232326360.2539@hadrien>
 <f909b4b31f123c7d88535db397a04421077ed0ab.camel@perches.com>
 <563222fbfdbb44daa98078db9d404972@AcuMS.aculab.com>
 <d2b2b528b9f296dfeb1d92554be024245abd678e.camel@perches.com>
 <alpine.DEB.2.21.1907242040490.10108@hadrien>
 <a0e892c3522f4df2991119a2a30cd62ec14c76cc.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 25 Jul 2019 15:59:03 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Thu, 25 Jul 2019 15:59:01 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: David Laight <David.Laight@ACULAB.COM>, cocci <cocci@systeme.lip6.fr>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cocci] [Fwd: [PATCH 1/2] string: Add stracpy and stracpy_pad
 mechanisms]
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



On Thu, 25 Jul 2019, Joe Perches wrote:

> On Wed, 2019-07-24 at 20:42 -0500, Julia Lawall wrote:
> > New version.  I check for non-use of the return value of strlcpy and
> > address some issues that affected the matching of the case where the first
> > argument involves a pointer dereference.  Actually, an isomorphism now
> > takes care of that case, so it doesn't show up in the semantic patch
> > explicitly any more.
> >
> > julia
>
> Nice x 2, thanks again.

Not quite nice due to the ignoring of rule 2 noticed by Markus.  There is
actually currently no guarantee that the size is right.  I'm testing a new
version.

>
> More comments:
>
> @@
> identifier f,i2,i1;
> struct i1 e1;
> expression e2;
> local idexpression x;
> position r.p;
> @@
> (
> -x = strlcpy
> +stracpy
>   (e1.f, e2
> -    , i2
>   )@p;
>   ... when != x
>
> Just for completeness and correctness, as I at
> least don't find an existing use:
>
> Perhaps this "x =" should also include += and +
> and the various other operators that are possible
> or does SmPL grammar already do that?

I could do this.  One might though think that if someone went to the
trouble of computing +=, these would be cases that we don't want to
change?  Still, it's not problem to add all assignment operators.

> Also, it might be nice to include the trivial
> conversion with sizeof(e1) and ARRAY_SIZE(e1)
> so a single script could be run over the kernel.

Sure, I'll do that when all this is working.  I didn't want those results
to drown out these ones.

thanks,
julia

>
> I'll see about adding that and try it myself
> so an automated conversion should be possible.
>
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
