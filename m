Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9221D2B7E23
	for <lists+cocci@lfdr.de>; Wed, 18 Nov 2020 14:16:14 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0AIDFwQ3028842;
	Wed, 18 Nov 2020 14:15:58 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id AD0A577C4;
	Wed, 18 Nov 2020 14:15:58 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 09EE15C34
 for <cocci@systeme.lip6.fr>; Wed, 18 Nov 2020 14:15:56 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0AIDFsbs025280
 for <cocci@systeme.lip6.fr>; Wed, 18 Nov 2020 14:15:54 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,486,1596492000"; d="scan'208";a="478177596"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 14:15:54 +0100
Date: Wed, 18 Nov 2020 14:15:53 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <62af4a93-dbc3-8aa0-6924-4dc479001d34@web.de>
Message-ID: <alpine.DEB.2.22.394.2011181413280.2641@hadrien>
References: <20201118080242.t6u6lchj5ww2fac4@adolin>
 <62af4a93-dbc3-8aa0-6924-4dc479001d34@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1777813137-1605705354=:2641"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 18 Nov 2020 14:15:58 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 18 Nov 2020 14:15:54 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH v2] coccinelle: locks: Add balancedlock.cocci
 script
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

--8323329-1777813137-1605705354=:2641
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

> > +++ b/scripts/coccinelle/locks/balancedlock.cocci
> …
> > +//# False positives may be generated due to locks released within a nested
> > +//# function call or a goto block.
> > +///
> > +// Confidence: Moderate
>
> How good does such information fit together?
>

What kind of response do you expect?  There are some concerns, so it's not
High confidence.  It works pretty well so it's not low confidence.  So
it's moderate confidence.  What else is there to say?

> …
> >+ (
> > +mutex_lock@p(E);
> > +|
> > +read_lock@p(E);
> > +|
> …
>
> Why did you not reorder the elements of such a SmPL disjunctions according to
> an usage incidence (which can be determined by another SmPL script like
> “report_lock_calls.cocci”)?

I don't recall ever seeing any evidence that it has an impact for function
calls.  Furthermore, the numbers will change over time.  So why change it?

> …
> > +msg = "This code segment might have an unbalanced lock."
> > +coccilib.org.print_todo(j0[0], msg)
>
> Please pass the string literal directly.
>
> +coccilib.org.print_todo(j0[0], "This code segment might have an unbalanced lock.")

The code is fine as it is.

julia
--8323329-1777813137-1605705354=:2641
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1777813137-1605705354=:2641--
