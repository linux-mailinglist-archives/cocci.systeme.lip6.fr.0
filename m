Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FBE392BB8
	for <lists+cocci@lfdr.de>; Thu, 27 May 2021 12:25:30 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 14RAP8iM010566;
	Thu, 27 May 2021 12:25:08 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 403A277F8;
	Thu, 27 May 2021 12:25:08 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id EF33B7648
 for <cocci@systeme.lip6.fr>; Thu, 27 May 2021 12:25:06 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 14RAP6R3023959
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 27 May 2021 12:25:06 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AKkpsfagAaByMwxB6UXVHHSqtYXBQXuQji2hC?=
 =?us-ascii?q?6mlwRA09TyX4raGTdZEgvnXJYVkqKRIdcLy7VZVoOEmsk6KdgrN+AV7BZmXbUQ?=
 =?us-ascii?q?KTRelfBeGL+UyYJ8SUzIFgPMlbE5SXBLXLfDpHZcuT2njeLz4rqOP3lZxBio/l?=
 =?us-ascii?q?vhNQcT0=3D?=
X-IronPort-AV: E=Sophos;i="5.82,334,1613430000"; d="scan'208";a="510240988"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2021 12:25:06 +0200
Date: Thu, 27 May 2021 12:25:06 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Fuad Tabba <tabba@google.com>
In-Reply-To: <CA+EHjTzCieJgFQOgiP5YQWurpV9dOj=bw+jF=GsTtum4vy67Ag@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2105271224160.12673@hadrien>
References: <CA+EHjTzCieJgFQOgiP5YQWurpV9dOj=bw+jF=GsTtum4vy67Ag@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 27 May 2021 12:25:09 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 27 May 2021 12:25:06 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Adding a line to a function after all variable
 declarations
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



On Thu, 27 May 2021, Fuad Tabba wrote:

> Hi,
>
> I'm trying to write a semantic patch that would add a new line to a
> function, but would like that line to come after all local variables
> (if any) have been declared. For example (distilled from what I am
> actually trying to accomplish):
>
> @@
> identifier f, s;
> @@
> f(..., struct mystruct *s, ...) {
> /* after any variable declarations*/
> + x = s->x;
>  ...
>  }
>
> I would like it to patch as follows:
>
> int function(struct mystruct *s) {
> + x = s->x;
> return 0;
> }
>
> as well as
>
> int function(struct mystruct *s)
> {
> int y;
> + x = s->x;
> return 0;
> }
>
> or
>
> int function(struct mystruct *s)
> {
> int y, z = 10;
> float f;
> + x = s->x;
> return 0;
> }
>
> Any suggestions on how I could do that?

@@
@@

f(...) {
... when != S
+ new_code
S
... when any
}

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
