Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 491F7BD3C5
	for <lists+cocci@lfdr.de>; Tue, 24 Sep 2019 22:49:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8OKnahW008211;
	Tue, 24 Sep 2019 22:49:36 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 87933779E;
	Tue, 24 Sep 2019 22:49:36 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id C2AE1779E
 for <cocci@systeme.lip6.fr>; Tue, 24 Sep 2019 22:49:34 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8OKnYPv003228
 for <cocci@systeme.lip6.fr>; Tue, 24 Sep 2019 22:49:34 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,545,1559512800"; d="scan'208";a="320516896"
Received: from ip-215.net-89-2-7.rev.numericable.fr (HELO hadrien)
 ([89.2.7.215])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 22:49:34 +0200
Date: Tue, 24 Sep 2019 22:49:33 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <b22031b2-2382-e629-a11a-09be7fc8e9c3@web.de>
Message-ID: <alpine.DEB.2.21.1909242249150.2589@hadrien>
References: <e07ce253-8a13-0f90-3ee0-79c1a0e78b38@web.de>
 <alpine.DEB.2.21.1909231058380.2283@hadrien>
 <c4437d9b-8795-fdfa-7914-fc30ead14cf7@web.de>
 <alpine.DEB.2.21.1909241729310.2282@hadrien>
 <f41b8e72-9a79-e65a-a652-8a257d5fac71@web.de>
 <alpine.DEB.2.21.1909242215440.2589@hadrien>
 <b22031b2-2382-e629-a11a-09be7fc8e9c3@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1950714443-1569358174=:2589"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 24 Sep 2019 22:49:36 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Tue, 24 Sep 2019 22:49:34 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Reducing source code around return statements with SmPL?
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

--8323329-1950714443-1569358174=:2589
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Tue, 24 Sep 2019, Markus Elfring wrote:

> >> elfring@Sonne:~/Projekte/Linux/next-patched> spatch ~/Projekte/Coccinelle/janitor/move_code_to_return2.cocci arch/arm64/kernel/ptrace.c
> >>
> >> Three source code places are pointed out by the SmPL rule “to_do1”
> >> as it would be expected.
> >> Unfortunately, I miss the message “INFO: May the local variable "err" be deleted?”
> >> for the function “ptrace_hbp_set_addr” according to the SmPL rule “to_do2”.
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kernel/ptrace.c?id=08f103b9a9502974109fab47ea35ca8542c4e57a#n451
> >>
> >> Which adjustments will become relevant here?
> >
> > In that function err is used elsewhere, so the second message should not
> > be printed.
>
> I disagree to this view (after the removal of previous uses).

What is causing the previous uses to be removed?

julia

>
> The following SmPL script variant can point also questionable variable declarations out.
>
> @check1@
> expression x;
> identifier rc;
> local idexpression lrc;
> position p;
> @@
>  lrc@rc = x@p;
>  return lrc;
>
> @check2@
> identifier check1.rc;
> position check1.p;
> type t;
> @@
>  t rc@p;
>  ... when != rc
>
> @script:python to_do1@
> p << check1.p;
> @@
> coccilib.org.print_todo(p[0],
>                         "WARNING: An expression was assigned to a local variable before it will be returned by the subsequent statement.")
>
> @script:python to_do2@
> p << check1.p;
> v << check1.rc;
> @@
> coccilib.org.print_todo(p[0],
>                         "INFO: May the local variable \""
>                         + v
>                         + "\" be deleted?")
>
>
> But how should be achieved that the notification for declarations
> which can be omitted will be presented only once for each affected local variable?
>
> Regards,
> Markus
>
--8323329-1950714443-1569358174=:2589
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1950714443-1569358174=:2589--
