Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC5720B806
	for <lists+cocci@lfdr.de>; Fri, 26 Jun 2020 20:20:20 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05QIK6Sa008014;
	Fri, 26 Jun 2020 20:20:06 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 38A1C7825;
	Fri, 26 Jun 2020 20:20:06 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 921C33D0F
 for <cocci@systeme.lip6.fr>; Fri, 26 Jun 2020 20:20:04 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05QIK4nn013282
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 26 Jun 2020 20:20:04 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,284,1589234400"; d="scan'208";a="456948233"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 20:20:03 +0200
Date: Fri, 26 Jun 2020 20:20:02 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <9725bf1f-06ea-63f3-2322-ffcce21cb218@web.de>
Message-ID: <alpine.DEB.2.22.394.2006262019430.10382@hadrien>
References: <9725bf1f-06ea-63f3-2322-ffcce21cb218@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-957014389-1593195603=:10382"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 26 Jun 2020 20:20:06 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 26 Jun 2020 20:20:04 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking the parsing for a nested SmPL disjunction
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

--8323329-957014389-1593195603=:10382
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Fri, 26 Jun 2020, Markus Elfring wrote:

> Hello,
>
> I have tried another small script variant out for the semantic patch language
> (according to the software combination “Coccinelle 1.0.8-00131-g675b9670”).
>
> @display@
> type t1, t2;
> expression action;
> identifier resource, y;
> statement is, es;
> @@
>  t1* resource;
>  <+... when any
> (t2 y = <+...
> (       sizeof(*(resource))
> |
> *       *(resource)
> )       ...+>

You are missing a ; here.

julia


> |
> *action(..., resource, ...)
> )
>  ...+>
>
>
> elfring@Sonne:~/Projekte/Coccinelle/janitor> spatch --parse-cocci show_problematic_disjunction-20200626.cocci
> …
> minus: parse error:
>   File "show_problematic_disjunction-20200626.cocci", line 14, column 0, charpos = 196
>   around = '|',
>   whole content = |
>
>
> May I expect that such SmPL disjunctions should also work?
>
> Regards,
> Markus
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
--8323329-957014389-1593195603=:10382
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-957014389-1593195603=:10382--
