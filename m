Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A143A1068D4
	for <lists+cocci@lfdr.de>; Fri, 22 Nov 2019 10:27:44 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAM9RSlm013167;
	Fri, 22 Nov 2019 10:27:28 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0030E77E5;
	Fri, 22 Nov 2019 10:27:27 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 02E4977D2
 for <cocci@systeme.lip6.fr>; Fri, 22 Nov 2019 10:27:27 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAM9RQn2001233
 for <cocci@systeme.lip6.fr>; Fri, 22 Nov 2019 10:27:26 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,229,1571695200"; d="scan'208";a="327630202"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 10:27:26 +0100
Date: Fri, 22 Nov 2019 10:27:27 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <cc561358-4d00-9f1f-eaa2-8fae400ccc8b@web.de>
Message-ID: <alpine.DEB.2.21.1911221025570.2793@hadrien>
References: <cc561358-4d00-9f1f-eaa2-8fae400ccc8b@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-593281367-1574414847=:2793"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 22 Nov 2019 10:27:28 +0100 (CET)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Fri, 22 Nov 2019 10:27:26 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Concerns around type safety for usage of expressions
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

--8323329-593281367-1574414847=:2793
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Fri, 22 Nov 2019, Markus Elfring wrote:

> Hello,
>
> The semantic patch language supports source code searches also for uses
> of specific data types. Such restricted searches can occasionally be nice.
> But we would like to find more software variations often enough.
> The consequence is that metavariables of the kind “expression” will usually
> be applied. But it becomes uncertain then to which data types the found
> expressions will be resolved finally.
>
> We would like to achieve considerably safe software transformations.
> Use cases occur then where the correct application of data types
> is essential. (The introduction of false positives is undesirable here.)
>
> How much can SmPL scripts help for corresponding changes?

You can specify the type of an expression rather than just expression.

The ability of Coccinlle to find the types depends on whether header files
are needed and whether Coccinelle can find those header files.

If a type is specified and Coccinelle cannot detetermine that an
expression has the required type, the match will fail.

julia
--8323329-593281367-1574414847=:2793
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-593281367-1574414847=:2793--
