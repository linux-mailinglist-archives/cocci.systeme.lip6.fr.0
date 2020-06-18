Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7472C1FFD29
	for <lists+cocci@lfdr.de>; Thu, 18 Jun 2020 23:09:00 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05IL8ips015016;
	Thu, 18 Jun 2020 23:08:44 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 98FA7402B;
	Thu, 18 Jun 2020 23:08:44 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id CF34A402B
 for <cocci@systeme.lip6.fr>; Thu, 18 Jun 2020 23:08:42 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05IL8g8c020969
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 18 Jun 2020 23:08:42 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,253,1589234400"; d="scan'208";a="455489962"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 23:08:42 +0200
Date: Thu, 18 Jun 2020 23:08:42 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Kees Cook <keescook@chromium.org>
In-Reply-To: <202006181346.ECCBE1FC0E@keescook>
Message-ID: <alpine.DEB.2.22.394.2006182308110.2367@hadrien>
References: <20200615102045.4558-1-efremov@linux.com>
 <202006171103.327F86B1C@keescook>
 <alpine.DEB.2.22.394.2006172051280.3083@hadrien>
 <202006181249.8B826D9@keescook>
 <alpine.DEB.2.22.394.2006182155260.2367@hadrien>
 <202006181346.ECCBE1FC0E@keescook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 18 Jun 2020 23:08:45 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 18 Jun 2020 23:08:42 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH] coccinelle: misc: add array_size_dup script to
 detect missed overlow checks
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



On Thu, 18 Jun 2020, Kees Cook wrote:

> On Thu, Jun 18, 2020 at 09:56:18PM +0200, Julia Lawall wrote:
> > @@
> > identifier i,fld;
> > expression e;
> > @@
> >
> > \(\(i\|e.fld\|e->fld\) \& E\)
> >
> > The e will match all of the variants you are concerned about.
>
> Ah, I see! Okay, that's good. And the "& E" part is to effectively
> collect it into E (as in, both the left and right of the & must match).

Yes

> So to do the matching from earlier:
>
> @@
> identifier i, fld;
> expression e, ARG1, ARG2;
> @@
>
> array_size(\(\(i\|e.fld\|e->fld\) \& ARG1\), ARG2);

Yes, that would be fine.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
