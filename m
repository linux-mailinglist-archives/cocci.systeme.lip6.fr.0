Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0FD204A6D
	for <lists+cocci@lfdr.de>; Tue, 23 Jun 2020 09:03:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05N72YYQ021134;
	Tue, 23 Jun 2020 09:02:34 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id DC52A7825;
	Tue, 23 Jun 2020 09:02:33 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 859AA410A
 for <cocci@systeme.lip6.fr>; Tue, 23 Jun 2020 09:02:32 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05N72VI2013306
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 23 Jun 2020 09:02:32 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,270,1589234400"; d="scan'208";a="456156865"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 09:02:31 +0200
Date: Tue, 23 Jun 2020 09:02:31 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <4014118b-90a6-68c5-048f-32485fa3e852@web.de>
Message-ID: <alpine.DEB.2.22.394.2006230902210.2367@hadrien>
References: <4014118b-90a6-68c5-048f-32485fa3e852@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1108794673-1592895751=:2367"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 23 Jun 2020 09:02:35 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 23 Jun 2020 09:02:32 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
        Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH v4] coccinelle: misc: add array_size_dup script
 to detect missed overflow checks
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

--8323329-1108794673-1592895751=:2367
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

I don't agree with any of these comments.

julia

On Tue, 23 Jun 2020, Markus Elfring wrote:

> > Changes in v2:
> …
> > - assignment operator used
>
> I prefer the distinction for the application of corresponding metavariables.
>
>
> > Changes in v3:
> …
> >  - \(&E1\|&E2\) changed to &\(E1\|E2\)
>
> Would it be more helpful to mention the movement of the ampersand
> before SmPL disjunctions?
>
>
> …
> >+/// Three types of patterns for these functions:
>
> Will another adjustment be needed according to your information “duplicates warning removed”?
>
>
> …
> > +virtual context
> > +virtual report
> > +virtual org
>
> Can the following SmPL code variant ever become more attractive?
>
> +virtual context, report, org
>
>
> …
> > +expression subE1 <= as.E1;
> > +expression subE2 <= as.E2;
> > +expression as.E1, as.E2, E3;
>
> How do you think about the following SmPL code variant?
>
> +expression subE1 <= as.E1,
> +           subE2 <= as.E2,
> +           as.E1, as.E2, E3;
>
>
> …
> > +msg = "WARNING: array_size is used later (line %s) to compute the same size" % (p2[0].line)
> > +coccilib.report.print_report(p1[0], msg)
>
> Please omit the extra Python variable “msg” for the passing of such simple message objects.
>
> What does hinder you to take the proposed script variants better into account?
>
> Regards,
> Markus
>
--8323329-1108794673-1592895751=:2367
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1108794673-1592895751=:2367--
