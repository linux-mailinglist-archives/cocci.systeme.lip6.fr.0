Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 516172A829C
	for <lists+cocci@lfdr.de>; Thu,  5 Nov 2020 16:49:45 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0A5FnJE1013947;
	Thu, 5 Nov 2020 16:49:19 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 3C6F977C4;
	Thu,  5 Nov 2020 16:49:19 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 0FBD67493
 for <cocci@systeme.lip6.fr>; Thu,  5 Nov 2020 16:49:17 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0A5FnG91015156
 for <cocci@systeme.lip6.fr>; Thu, 5 Nov 2020 16:49:16 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,453,1596492000"; d="scan'208";a="363761689"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 16:49:13 +0100
Date: Thu, 5 Nov 2020 16:49:12 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <7035a5fc-0a9f-09be-fb6a-c3418e98a953@web.de>
Message-ID: <alpine.DEB.2.22.394.2011051648030.3219@hadrien>
References: <7035a5fc-0a9f-09be-fb6a-c3418e98a953@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-123859853-1604591353=:3219"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 05 Nov 2020 16:49:19 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 05 Nov 2020 16:49:16 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking the handling of spaces before opening
 parentheses for source code transformations
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

--8323329-123859853-1604591353=:3219
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Thu, 5 Nov 2020, Markus Elfring wrote:

> Hello,
>
> The coding style specification for C programs in GNOME contains also
> the following information.
> https://developer.gnome.org/programming-guidelines/stable/c-coding-style.html.en#whitespace
>
> “…
> Always put a space before an opening parenthesis but never after:
> …”
>
>
> How good can the semantic patch language support such a requirement
> (also for function declarations and corresponding calls) directly?
>
> See also a related feature request once more:
> Make change influence configurable for coding style rules
> https://github.com/coccinelle/coccinelle/issues/37

If you want to check for such properties, you can use position variables.
If you want to ensure that your generated code has such properties, you
can use the argument --smpl-spacing.  If you want something more, you are
welcome to implement it.  We only focus on the coding style of the Linux
kernel.

julia
--8323329-123859853-1604591353=:3219
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-123859853-1604591353=:3219--
