Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 805891F070B
	for <lists+cocci@lfdr.de>; Sat,  6 Jun 2020 16:39:35 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 056EdHNV029139;
	Sat, 6 Jun 2020 16:39:17 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id AD0A3777D;
	Sat,  6 Jun 2020 16:39:17 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 60E363BAB
 for <cocci@systeme.lip6.fr>; Sat,  6 Jun 2020 16:39:15 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 056EdE9K026629
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sat, 6 Jun 2020 16:39:14 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,480,1583190000"; d="scan'208";a="350775451"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2020 16:39:14 +0200
Date: Sat, 6 Jun 2020 16:39:13 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <119d91fd-1ad0-8842-10eb-ee8fa16da1b0@web.de>
Message-ID: <alpine.DEB.2.21.2006061634130.19534@hadrien>
References: <119d91fd-1ad0-8842-10eb-ee8fa16da1b0@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1629768455-1591454354=:19534"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 06 Jun 2020 16:39:18 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 06 Jun 2020 16:39:14 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH] coccinelle: api: add kvfree script
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1629768455-1591454354=:19534
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sat, 6 Jun 2020, Markus Elfring wrote:

> > +@choice@
> > +expression E, E1;
> > +position kok, vok;
> > +@@
> > +
> > +(
> > +  if (...) {
> > +    ...
> > +    E = \(kmalloc@kok\|…\)(...)
>
> Further implementation details from this SmPL script caught my software
> development attention.
>
> * Is there a need to add the specification “when any” to the SmPL ellipses
>   before such assignment statements?

Having multiple assignments to kmalloc in one if seems unlikely, and
perhaps one would want to think about such a case differently, so it seems
ok as is.

>
> * A limited search approach was expressed. Will additional source code variations
>   become relevant?
>   + switch statement
>   + if branches with single statements
>   + conditional operator

The point is that there is a kmalloc in one branch and a vmalloc in
another branch, so a if with a single branch doesn't seem relevant.

The other cases sem highly improbable.

>
> > +@opportunity depends on !patch …@
> …
> > +  E = \(kmalloc\|…\)(..., size, ...)
> > +  ... when != E = E1
> > +      when != size = E1
>
> I wonder that two assignments should be excluded here according to
> the same expression metavariable.

Doesn't matter.  The metavariables are considered separately in the
different whens.

>
> +@pkfree depends on patch exists@
> …
> +- \(kfree\|kvfree\)(E)
> ++ vfree(E)
>
> Would you like to use a SmPL code variant like the following
> at any more places?
> (Is it occasionally helpful to increase the change precision?)
>
> +-\(kfree\|kvfree\)
> ++vfree
> +      (E)

"increase the change precision" seems to be an obscure way to say "improve
the formatting".  Indeed, leaving (E) as is would have the effect of not
changing the formatting.  But the problem seems unlikely for a functoin
with such a short name.  And this presentation will likely run afoul of
the fact that you can't attach + code to a disjunction.  So the original
presentation was more concise, and should be fine in practice.

julia
--8323329-1629768455-1591454354=:19534
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1629768455-1591454354=:19534--
