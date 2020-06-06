Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 339E01F0650
	for <lists+cocci@lfdr.de>; Sat,  6 Jun 2020 13:12:06 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 056BBoAb006342;
	Sat, 6 Jun 2020 13:11:50 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 42550777D;
	Sat,  6 Jun 2020 13:11:50 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9556F3BAB
 for <cocci@systeme.lip6.fr>; Sat,  6 Jun 2020 13:11:48 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 056BBlmt020061
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sat, 6 Jun 2020 13:11:47 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,479,1583190000"; d="scan'208";a="453305694"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2020 13:11:47 +0200
Date: Sat, 6 Jun 2020 13:11:46 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <51a176d4-8c59-5da1-b4d2-c97b17b691a7@web.de>
Message-ID: <alpine.DEB.2.21.2006061307020.2578@hadrien>
References: <99ed463c-b7ba-0400-7cf7-5bcc1992baef@web.de>
 <alpine.DEB.2.21.2006060944320.2578@hadrien>
 <51a176d4-8c59-5da1-b4d2-c97b17b691a7@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 06 Jun 2020 13:11:50 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 06 Jun 2020 13:11:47 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] coccinelle: api: add kvfree script
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



On Sat, 6 Jun 2020, Markus Elfring wrote:

> >>> +    E = \(kmalloc@kok\|kzalloc@kok\|krealloc@kok\|kcalloc@kok\|kmalloc_node@kok\|kzalloc_node@kok\|kmalloc_array@kok\|kmalloc_array_node@kok\|kcalloc_node@kok\)(...)
> >>
> >> I would prefer an other coding style here.
> >>
> >> * Items for such SmPL disjunctions can be specified also on multiple lines.
> >>
> >> * The semantic patch language supports further means to handle function name lists
> >>   in more convenient ways.
> >>   Would you like to work with customised constraints?
> >
> > Please don't follow this advice.
>
> I have got recurring understanding difficulties with such a response.
> Will quoted patch review issues clarified in any other ways?
>
>
> > Coccinelle is not able to optimize its search process according to
> > the information in constraints.  It will needlessly parse many files.
>
> The software supports also SmPL constraints for some reasons.
> Why should such functionality be used at all if the immediate reminder is
> there seem to be more important optimisation aspects to consider before?

If the number of functions is really large, constraints may be a better
idea.

If the names of the functions are not actually known, constraints may be a
better idea.

If it is desired to collect some statistics about the matching process,
constraints allow that.

If it is desired to reason about values, for example that a constant is
greater or less than some value, then constraints allow that.

If it is desired to avoid changing code in a particular function, then
constraints allow that.

So there are a lot of reasons why constraints are useful.  There are
likely even more.  But hiding information that could be apparent to the
SmPL compiler and could be used to improve the performance of the matching
process is not one of them.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
