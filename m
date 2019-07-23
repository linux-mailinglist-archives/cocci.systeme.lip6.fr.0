Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BAD7232F
	for <lists+cocci@lfdr.de>; Wed, 24 Jul 2019 01:42:57 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6NNgUif021382;
	Wed, 24 Jul 2019 01:42:30 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A5D1F7791;
	Wed, 24 Jul 2019 01:42:30 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from osiris.lip6.fr (osiris.lip6.fr [132.227.60.30])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id CE67076BF
 for <cocci@systeme.lip6.fr>; Wed, 24 Jul 2019 01:42:26 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0036.hostedemail.com
 [216.40.44.36])
 by osiris.lip6.fr (8.15.2/8.15.2) with ESMTP id x6NNgOhd019849
 for <cocci@systeme.lip6.fr>; Wed, 24 Jul 2019 01:42:25 +0200 (CEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 48EDC182251C0;
 Tue, 23 Jul 2019 23:42:22 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::,
 RULES_HIT:41:355:379:599:800:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2559:2563:2682:2685:2693:2828:2859:2895:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3354:3622:3865:3866:3867:3868:3870:3871:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:4362:5007:7653:7875:7903:8603:9025:10004:10400:10848:11026:11232:11473:11658:11914:12043:12296:12297:12555:12740:12760:12895:12986:13069:13161:13229:13311:13357:13439:14181:14659:14721:21080:21324:21433:21451:21627:21811:30029:30054:30070:30079:30090:30091,
 0,
 RBL:172.222.149.92:@perches.com:.lbl8.mailshell.net-62.8.0.145 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:28,
 LUA_SUMMARY:none
X-HE-Tag: arch08_31ad5a36be712
X-Filterd-Recvd-Size: 2901
Received: from XPS-9350 (172-222-149-092.dhcp.chtrptr.net [172.222.149.92])
 (Authenticated sender: joe@perches.com)
 by omf12.hostedemail.com (Postfix) with ESMTPA;
 Tue, 23 Jul 2019 23:42:21 +0000 (UTC)
Message-ID: <0f3ba090dfc956f5651e6c7c430abdba94ddcb8b.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 23 Jul 2019 16:42:19 -0700
In-Reply-To: <alpine.DEB.2.21.1907231546090.2551@hadrien>
References: <7ab8957eaf9b0931a59eff6e2bd8c5169f2f6c41.1563841972.git.joe@perches.com>
 <66fcdbf607d7d0bea41edb39e5579d63b62b7d84.camel@perches.com>
 <alpine.DEB.2.21.1907231546090.2551@hadrien>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 24 Jul 2019 01:42:33 +0200 (CEST)
X-Greylist: Delayed for 18:10:03 by milter-greylist-4.4.3 (osiris.lip6.fr
 [132.227.60.30]); Wed, 24 Jul 2019 01:42:25 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.30
Cc: cocci <cocci@systeme.lip6.fr>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cocci] [Fwd: [PATCH 1/2] string: Add stracpy and stracpy_pad
 mechanisms]
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

On Tue, 2019-07-23 at 15:52 -0500, Julia Lawall wrote:
> On Mon, 22 Jul 2019, Joe Perches wrote:
> > I just sent a patch to add yet another string copy mechanism.
> > 
> > This could help avoid misuses of strscpy and strlcpy like this
> > patch set:
> > 
> > https://lore.kernel.org/lkml/cover.1562283944.git.joe@perches.com/T/
> > 
> > A possible cocci script to do conversions could be:
> > 
> >    $ cat str.cpy.cocci
> >    @@
> >    expression e1;
> >    expression e2;
> >    @@
> > 
> >    - strscpy(e1, e2, sizeof(e1))
> >    + stracpy(e1, e2)
> > 
> >    @@
> >    expression e1;
> >    expression e2;
> >    @@
> > 
> >    - strlcpy(e1, e2, sizeof(e1))
> >    + stracpy(e1, e2)
> > 
> > This obviously does not match the style of all the
> > scripts/coccinelle cocci files, but this might be
> > something that could be added improved and added.
> > 
> > This script produces:
> > 
> > $ spatch --in-place -sp-file str.cpy.cocci .
> > $ git checkout tools/
> > $ git diff --shortstat
> >  958 files changed, 2179 insertions(+), 2655 deletions(-)
> > 
> > The remainder of strlcpy and strscpy uses in the
> > kernel would generally have a form like:
> > 
> > 	strlcpy(to, from, DEFINE)
> > 
> > where DEFINE is the specified size of to
> > 
> > Could the cocci script above be updated to find
> > and correct those styles as well?
> 
> I guess it would depend on what "to" is and what DEFINE expands into.  For
> example, in cpuidle-powernv.c, I see:
> 
> strlcpy(powernv_states[index].name, name, CPUIDLE_NAME_LEN);
> 
> and by poking around I see:
> 
> struct cpuidle_state {
> 	char		name[CPUIDLE_NAME_LEN];
> 	char		desc[CPUIDLE_DESC_LEN];
> 	...
> };

Yes, ideally this case would not modify the #define for the
length but adapt the strlcpy(,,DEFINE)

There are a lot of these in drivers/hwmon using I2C_NAME_SIZE.

> I will look into it.

Thanks.


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
